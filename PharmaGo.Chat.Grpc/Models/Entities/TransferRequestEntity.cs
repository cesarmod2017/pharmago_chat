namespace PharmaGo.Chat.Grpc.Models.Entities;

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
