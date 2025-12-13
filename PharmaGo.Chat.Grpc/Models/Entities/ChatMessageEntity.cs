namespace PharmaGo.Chat.Grpc.Models.Entities;

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
