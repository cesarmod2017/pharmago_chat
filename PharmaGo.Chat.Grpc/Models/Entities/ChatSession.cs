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

    // Navigation
    public virtual ICollection<ChatMessageEntity> Messages { get; set; } = new List<ChatMessageEntity>();
    public virtual ICollection<TransferRequestEntity> TransferRequests { get; set; } = new List<TransferRequestEntity>();
}

public class ChatMessageEntity
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid SessionId { get; set; }
    public string Role { get; set; } = "user"; // user, assistant, system, operator
    public string Content { get; set; } = string.Empty;
    public DateTime Timestamp { get; set; } = DateTime.UtcNow;
    public string? ModelUsed { get; set; }
    public int TokensUsed { get; set; } = 0;
    public string? SenderId { get; set; }
    public string? SenderName { get; set; }

    // Navigation
    public virtual ChatSession Session { get; set; } = null!;
}

public class TransferRequestEntity
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid SessionId { get; set; }
    public string Reason { get; set; } = string.Empty;
    public int Priority { get; set; } = 3;
    public string Status { get; set; } = "pending"; // pending, accepted, completed, cancelled
    public DateTime RequestedAt { get; set; } = DateTime.UtcNow;
    public DateTime? AcceptedAt { get; set; }
    public DateTime? CompletedAt { get; set; }
    public string? OperatorId { get; set; }
    public string? OperatorName { get; set; }
    public string? Resolution { get; set; }
    public string? Notes { get; set; }

    // Navigation
    public virtual ChatSession Session { get; set; } = null!;
}
