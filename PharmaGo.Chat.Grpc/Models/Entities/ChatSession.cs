namespace PharmaGo.Chat.Grpc.Models.Entities;

public class ChatSession
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string UserName { get; set; } = string.Empty;
    public string UserEmail { get; set; } = string.Empty;
    public string Status { get; set; } = "active"; // active, ended, transferred
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime LastActivity { get; set; } = DateTime.UtcNow;
    public DateTime? EndedAt { get; set; }
    public int MessageCount { get; set; } = 0;
    public int TotalTokens { get; set; } = 0;
    public string? CurrentOperatorId { get; set; }
    public string Metadata { get; set; } = "{}";

    // New session parameters for multi-client/agent support
    /// <summary>
    /// Client identifier (e.g., farmago, linx, aotech)
    /// </summary>
    public string Client { get; set; } = string.Empty;

    /// <summary>
    /// Agent name for prompt customization
    /// </summary>
    public string AgentName { get; set; } = string.Empty;

    /// <summary>
    /// ERP name (optional, e.g., linx, totvs)
    /// </summary>
    public string? ErpName { get; set; }

    /// <summary>
    /// Language for responses (e.g., pt-BR, en-US, es-ES)
    /// </summary>
    public string Language { get; set; } = "pt-BR";

    /// <summary>
    /// Type for filtering prompts and RAG documents
    /// </summary>
    public string Type { get; set; } = string.Empty;

    // Navigation
    public virtual ICollection<ChatMessageEntity> Messages { get; set; } = new List<ChatMessageEntity>();
    public virtual ICollection<TransferRequestEntity> TransferRequests { get; set; } = new List<TransferRequestEntity>();
}
