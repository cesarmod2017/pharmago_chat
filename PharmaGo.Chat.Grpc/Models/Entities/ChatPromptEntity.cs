namespace PharmaGo.Chat.Grpc.Models.Entities;

public class ChatPromptEntity
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string Name { get; set; } = string.Empty;
    public string Type { get; set; } = string.Empty; // linx, farmago, aotech, default, etc.
    public string Prompt { get; set; } = string.Empty;
    public string WelcomeMessage { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}
