using PharmaGo.Chat.Grpc.Configurations;

namespace PharmaGo.Chat.Grpc.Services.AI;

public interface IAIServiceFactory
{
    IAIService GetService(string? modelName = null);
    IAIService GetEmbeddingService();
}

public class AIServiceFactory : IAIServiceFactory
{
    private readonly IServiceProvider _serviceProvider;
    private readonly ChatSettings _settings;
    private readonly ILogger<AIServiceFactory> _logger;

    public AIServiceFactory(
        IServiceProvider serviceProvider,
        ChatSettings settings,
        ILogger<AIServiceFactory> logger)
    {
        _serviceProvider = serviceProvider;
        _settings = settings;
        _logger = logger;
    }

    public IAIService GetService(string? modelName = null)
    {
        var model = string.IsNullOrEmpty(modelName) ? _settings.AI.DefaultModel : modelName.ToLowerInvariant();

        _logger.LogDebug("Getting AI service for model: {Model}", model);

        return model switch
        {
            "claude" => _serviceProvider.GetRequiredService<ClaudeService>(),
            "gpt-5.0" or "gpt-5.1" or "gpt-4.1" => CreateOpenAIService(model),
            _ => _serviceProvider.GetRequiredService<ClaudeService>() // Default to Claude
        };
    }

    public IAIService GetEmbeddingService()
    {
        // Always use OpenAI for embeddings
        return CreateOpenAIService("gpt-4.1");
    }

    private OpenAIService CreateOpenAIService(string modelKey)
    {
        var httpClientFactory = _serviceProvider.GetRequiredService<IHttpClientFactory>();
        var settings = _serviceProvider.GetRequiredService<ChatSettings>();
        var logger = _serviceProvider.GetRequiredService<ILogger<OpenAIService>>();

        return new OpenAIService(
            httpClientFactory.CreateClient("OpenAI"),
            settings,
            logger,
            modelKey);
    }
}
