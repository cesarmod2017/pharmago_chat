using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Configurations;
using PharmaGo.Chat.Grpc.Data.Context;
using PharmaGo.Chat.Grpc.Services.AI;
using PharmaGo.Chat.Grpc.Services.Chat;
using PharmaGo.Chat.Grpc.Services.RAG;
using PharmaGo.Chat.Grpc.Services.Prompts;
using PharmaGo.Chat.Grpc.Services.Support;
using Polly;
using Polly.Extensions.Http;
using StackExchange.Redis;

// Enable legacy timestamp behavior for Npgsql
AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

var builder = WebApplication.CreateBuilder(args);

// ============================================================================
// Configuration
// ============================================================================
var chatSettings = builder.Configuration.GetSection("ChatSettings").Get<ChatSettings>() ?? new ChatSettings();

// Load configuration from HashiCorp Vault based on ENVIRONMENT variable
Console.WriteLine("[CONFIG] Loading configuration from Vault...");
chatSettings.LoadEnvironmentVault();

builder.Services.AddSingleton(chatSettings);

builder.Services.Configure<ChatSettings>(builder.Configuration.GetSection("ChatSettings"));
builder.Services.AddSingleton(chatSettings);

// ============================================================================
// PostgreSQL with pgVector
// ============================================================================
Console.WriteLine("[CONFIG] Configuring PostgreSQL with pgVector...");
builder.Services.AddDbContext<ChatDbContext>(options =>
{
    options.UseNpgsql(chatSettings.Postgres.ConnectionString, npgsqlOptions =>
    {
        npgsqlOptions.UseVector();
        npgsqlOptions.CommandTimeout(chatSettings.Postgres.CommandTimeout);
        npgsqlOptions.EnableRetryOnFailure(
            maxRetryCount: 5,
            maxRetryDelay: TimeSpan.FromSeconds(30),
            errorCodesToAdd: null);
    });
});

// ============================================================================
// Redis
// ============================================================================
Console.WriteLine("[CONFIG] Configuring Redis...");
Console.WriteLine($"[REDIS] Host: {chatSettings.Redis.Host}");

var redisConfig = ConfigurationOptions.Parse(chatSettings.Redis.Host);
redisConfig.Password = chatSettings.Redis.Password;
redisConfig.DefaultDatabase = chatSettings.Redis.Database;
redisConfig.ConnectTimeout = chatSettings.Redis.ConnectTimeout;
redisConfig.SyncTimeout = chatSettings.Redis.SyncTimeout;
redisConfig.AbortOnConnectFail = chatSettings.Redis.AbortOnConnectFail;
redisConfig.AllowAdmin = chatSettings.Redis.AllowAdmin;

builder.Services.AddSingleton<IConnectionMultiplexer>(sp =>
{
    return ConnectionMultiplexer.Connect(redisConfig);
});
builder.Services.AddSingleton<IChatCacheService, RedisCacheService>();

// ============================================================================
// HTTP Clients for AI APIs
// ============================================================================
Console.WriteLine("[CONFIG] Configuring HTTP Clients for AI APIs...");

// Retry policy for HTTP clients
var retryPolicy = HttpPolicyExtensions
    .HandleTransientHttpError()
    .WaitAndRetryAsync(3, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));

var timeoutPolicy = Policy.TimeoutAsync<HttpResponseMessage>(TimeSpan.FromMinutes(5));

// Claude HTTP Client
builder.Services.AddHttpClient<ClaudeService>("Claude", client =>
{
    client.BaseAddress = new Uri("https://api.anthropic.com/");
    client.Timeout = TimeSpan.FromMinutes(5);
})
.AddPolicyHandler(retryPolicy)
.AddPolicyHandler(timeoutPolicy);

// OpenAI HTTP Client
builder.Services.AddHttpClient("OpenAI", client =>
{
    client.BaseAddress = new Uri("https://api.openai.com/");
    client.Timeout = TimeSpan.FromMinutes(5);
})
.AddPolicyHandler(retryPolicy)
.AddPolicyHandler(timeoutPolicy);

// ============================================================================
// Application Services
// ============================================================================
Console.WriteLine("[CONFIG] Registering application services...");

// AI Services
builder.Services.AddSingleton<IAIServiceFactory, AIServiceFactory>();
builder.Services.AddTransient<ClaudeService>();

// RAG Service
builder.Services.AddScoped<IRagService, RagService>();

// ============================================================================
// gRPC Configuration
// ============================================================================
Console.WriteLine("[CONFIG] Configuring gRPC...");

builder.Services.AddGrpc(options =>
{
    options.MaxReceiveMessageSize = 50 * 1024 * 1024; // 50 MB
    options.MaxSendMessageSize = 50 * 1024 * 1024; // 50 MB
    options.EnableDetailedErrors = builder.Environment.IsDevelopment();
});

builder.Services.AddGrpcReflection();

// ============================================================================
// CORS
// ============================================================================
builder.Services.AddCors(options =>
{
    options.AddPolicy("CorsPolicy", policy =>
    {
        policy
            .AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader()
            .WithExposedHeaders(
                "Grpc-Status",
                "Grpc-Message",
                "Grpc-Encoding",
                "Grpc-Accept-Encoding");
    });
});

// ============================================================================
// Health Checks
// ============================================================================
builder.Services.AddHealthChecks()
    .AddNpgSql(chatSettings.Postgres.ConnectionString, name: "postgres")
    .AddRedis(chatSettings.Redis.Host, name: "redis");

// ============================================================================
// Kestrel Configuration
// ============================================================================
builder.WebHost.ConfigureKestrel(options =>
{
    options.Limits.MaxConcurrentConnections = 200;
    options.Limits.MaxConcurrentUpgradedConnections = 200;
    options.Limits.MaxRequestBodySize = 50 * 1024 * 1024; // 50 MB
    options.Limits.KeepAliveTimeout = TimeSpan.FromMinutes(30);
    options.Limits.RequestHeadersTimeout = TimeSpan.FromMinutes(5);
    options.Limits.MinRequestBodyDataRate = null;
    options.Limits.MinResponseDataRate = null;

    // HTTP/2 settings for gRPC
    options.Limits.Http2.KeepAlivePingDelay = TimeSpan.FromSeconds(30);
    options.Limits.Http2.KeepAlivePingTimeout = TimeSpan.FromSeconds(20);
    options.Limits.Http2.MaxStreamsPerConnection = 100;

    options.ConfigureEndpointDefaults(listenOptions =>
    {
        listenOptions.Protocols = Microsoft.AspNetCore.Server.Kestrel.Core.HttpProtocols.Http2;
    });
});

// ============================================================================
// Build Application
// ============================================================================
var app = builder.Build();

// ============================================================================
// Middleware Pipeline
// ============================================================================
var logger = app.Services.GetRequiredService<ILogger<Program>>();

app.Use(async (context, next) =>
{
    logger.LogDebug("[REQUEST] {Method} {Path} - Protocol: {Protocol}",
        context.Request.Method, context.Request.Path, context.Request.Protocol);
    await next.Invoke();
    logger.LogDebug("[RESPONSE] {Path} - Status: {Status}",
        context.Request.Path, context.Response.StatusCode);
});

app.UseRouting();
app.UseCors("CorsPolicy");
app.UseGrpcWeb(new GrpcWebOptions { DefaultEnabled = true });

// ============================================================================
// Map Endpoints
// ============================================================================
app.MapHealthChecks("/health");

// gRPC Services
app.MapGrpcService<ChatGrpcService>().RequireCors("CorsPolicy").EnableGrpcWeb();
app.MapGrpcService<RagGrpcService>().RequireCors("CorsPolicy").EnableGrpcWeb();
app.MapGrpcService<SupportGrpcService>().RequireCors("CorsPolicy").EnableGrpcWeb();
app.MapGrpcService<PromptGrpcService>().RequireCors("CorsPolicy").EnableGrpcWeb();

if (app.Environment.IsDevelopment())
{
    app.MapGrpcReflectionService();
}

app.MapGet("/", () => "PharmaGo.Chat.Grpc - Communication with gRPC endpoints must be made through a gRPC client.");



Console.WriteLine("Starting migrations...");
app.ApplyDatabaseMigrations();
Console.WriteLine("Starting application...");
// ============================================================================
// Run Application
// ============================================================================
Console.WriteLine("[STARTUP] PharmaGo.Chat.Grpc is starting...");


await app.RunAsync();
