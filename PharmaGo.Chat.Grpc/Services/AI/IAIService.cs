namespace PharmaGo.Chat.Grpc.Services.AI;

public interface IAIService
{
    string ModelName { get; }
    Task<AIResponse> GenerateResponseAsync(AIRequest request, CancellationToken cancellationToken = default);
    IAsyncEnumerable<AIResponseChunk> GenerateStreamingResponseAsync(AIRequest request, CancellationToken cancellationToken = default);
    Task<float[]> GenerateEmbeddingAsync(string text, CancellationToken cancellationToken = default);
}

public class AIRequest
{
    public string SystemPrompt { get; set; } = string.Empty;
    public List<AIMessage> Messages { get; set; } = new();
    public string? Context { get; set; } // RAG context
    public int MaxTokens { get; set; } = 4096;
    public float Temperature { get; set; } = 0.7f;
}

public class AIMessage
{
    public string Role { get; set; } = "user"; // user, assistant, system
    public string Content { get; set; } = string.Empty;
}

public class AIResponse
{
    public string Content { get; set; } = string.Empty;
    public string ModelUsed { get; set; } = string.Empty;
    public int TokensUsed { get; set; }
    public int PromptTokens { get; set; }
    public int CompletionTokens { get; set; }
}

public class AIResponseChunk
{
    public string Content { get; set; } = string.Empty;
    public bool IsFinal { get; set; }
    public string ModelUsed { get; set; } = string.Empty;
    public int TokensUsed { get; set; }
}
