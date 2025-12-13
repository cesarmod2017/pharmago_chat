using PharmaGo.Chat.Grpc.Services.AI;

namespace PharmaGo.Chat.Grpc.Services.Chat;

public interface IChatCacheService
{
    // Session management
    Task<bool> CreateSessionAsync(string sessionId, string userName, string userEmail, string client, string agentName, string? erpName, string language, string type, Dictionary<string, string>? metadata = null);
    Task<SessionCacheData?> GetSessionAsync(string sessionId);
    Task UpdateSessionActivityAsync(string sessionId);
    Task EndSessionAsync(string sessionId);
    Task<bool> SessionExistsAsync(string sessionId);

    // Message history
    Task AddMessageAsync(string sessionId, AIMessage message);
    Task<List<AIMessage>> GetHistoryAsync(string sessionId, int limit = 50);
    Task ClearHistoryAsync(string sessionId);

    // Session stats
    Task IncrementMessageCountAsync(string sessionId);
    Task AddTokensUsedAsync(string sessionId, int tokens);

    // Support transfer
    Task SetTransferredAsync(string sessionId, string operatorId);
    Task ClearTransferredAsync(string sessionId);

    // Pub/Sub for real-time messaging
    Task PublishMessageAsync(string channel, string message);
    IAsyncEnumerable<string> SubscribeAsync(string channel, CancellationToken cancellationToken);
}

public class SessionCacheData
{
    public string SessionId { get; set; } = string.Empty;
    public string UserName { get; set; } = string.Empty;
    public string UserEmail { get; set; } = string.Empty;
    public string Status { get; set; } = "active";
    public DateTime CreatedAt { get; set; }
    public DateTime LastActivity { get; set; }
    public int MessageCount { get; set; }
    public int TotalTokens { get; set; }
    public string? OperatorId { get; set; }
    public Dictionary<string, string> Metadata { get; set; } = new();

    // New multi-client/agent fields
    public string Client { get; set; } = string.Empty;
    public string AgentName { get; set; } = string.Empty;
    public string? ErpName { get; set; }
    public string Language { get; set; } = "pt-BR";
    public string Type { get; set; } = string.Empty;
}
