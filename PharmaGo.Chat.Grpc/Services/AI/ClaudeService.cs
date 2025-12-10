using PharmaGo.Chat.Grpc.Configurations;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.Json;

namespace PharmaGo.Chat.Grpc.Services.AI;

public class ClaudeService : IAIService
{
    private readonly HttpClient _httpClient;
    private readonly ClaudeSettings _settings;
    private readonly ILogger<ClaudeService> _logger;

    public string ModelName => "claude";

    public ClaudeService(
        HttpClient httpClient,
        ChatSettings settings,
        ILogger<ClaudeService> logger)
    {
        _httpClient = httpClient;
        _settings = settings.AI.Claude;
        _logger = logger;

        _httpClient.DefaultRequestHeaders.Add("x-api-key", _settings.ApiKey);
        _httpClient.DefaultRequestHeaders.Add("anthropic-version", _settings.ApiVersion);
    }

    public async Task<AIResponse> GenerateResponseAsync(AIRequest request, CancellationToken cancellationToken = default)
    {
        var claudeRequest = BuildRequest(request, stream: false);

        var response = await _httpClient.PostAsJsonAsync(_settings.ApiUrl, claudeRequest, cancellationToken);
        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadFromJsonAsync<ClaudeResponse>(cancellationToken: cancellationToken);

        return new AIResponse
        {
            Content = result?.Content?.FirstOrDefault()?.Text ?? string.Empty,
            ModelUsed = _settings.Model,
            TokensUsed = (result?.Usage?.InputTokens ?? 0) + (result?.Usage?.OutputTokens ?? 0),
            PromptTokens = result?.Usage?.InputTokens ?? 0,
            CompletionTokens = result?.Usage?.OutputTokens ?? 0
        };
    }

    public async IAsyncEnumerable<AIResponseChunk> GenerateStreamingResponseAsync(
        AIRequest request,
        [EnumeratorCancellation] CancellationToken cancellationToken = default)
    {
        var claudeRequest = BuildRequest(request, stream: true);
        var jsonContent = JsonSerializer.Serialize(claudeRequest);
        var content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

        using var httpRequest = new HttpRequestMessage(HttpMethod.Post, _settings.ApiUrl)
        {
            Content = content
        };

        using var response = await _httpClient.SendAsync(
            httpRequest,
            HttpCompletionOption.ResponseHeadersRead,
            cancellationToken);

        response.EnsureSuccessStatusCode();

        await using var stream = await response.Content.ReadAsStreamAsync(cancellationToken);
        using var reader = new StreamReader(stream);

        int totalTokens = 0;
        var fullContent = new StringBuilder();

        while (!reader.EndOfStream)
        {
            var line = await reader.ReadLineAsync(cancellationToken);
            if (string.IsNullOrEmpty(line)) continue;

            if (line.StartsWith("data: "))
            {
                var jsonData = line[6..];
                if (jsonData == "[DONE]") break;

                AIResponseChunk? chunk = null;

                try
                {
                    var eventData = JsonSerializer.Deserialize<ClaudeStreamEvent>(jsonData.AsSpan());

                    if (eventData?.Type == "content_block_delta" && eventData.Delta?.Text != null)
                    {
                        fullContent.Append(eventData.Delta.Text);
                        chunk = new AIResponseChunk
                        {
                            Content = eventData.Delta.Text,
                            IsFinal = false,
                            ModelUsed = _settings.Model
                        };
                    }
                    else if (eventData?.Type == "message_delta" && eventData.Usage != null)
                    {
                        totalTokens = eventData.Usage.OutputTokens;
                    }
                    else if (eventData?.Type == "message_stop")
                    {
                        chunk = new AIResponseChunk
                        {
                            Content = string.Empty,
                            IsFinal = true,
                            ModelUsed = _settings.Model,
                            TokensUsed = totalTokens
                        };
                    }
                }
                catch (JsonException ex)
                {
                    _logger.LogWarning(ex, "Failed to parse streaming response: {Data}", jsonData);
                }

                if (chunk != null)
                {
                    yield return chunk;
                }
            }
        }
    }

    public Task<float[]> GenerateEmbeddingAsync(string text, CancellationToken cancellationToken = default)
    {
        // Claude doesn't have native embedding API, use OpenAI embeddings instead
        throw new NotSupportedException("Claude does not support embeddings. Use OpenAI embedding service.");
    }

    private object BuildRequest(AIRequest request, bool stream)
    {
        var messages = new List<object>();

        foreach (var msg in request.Messages)
        {
            messages.Add(new
            {
                role = msg.Role == "assistant" ? "assistant" : "user",
                content = msg.Content
            });
        }

        var systemContent = request.SystemPrompt;
        if (!string.IsNullOrEmpty(request.Context))
        {
            systemContent += $"\n\n## Contexto Relevante:\n{request.Context}";
        }

        return new
        {
            model = _settings.Model,
            max_tokens = request.MaxTokens > 0 ? request.MaxTokens : _settings.MaxTokens,
            temperature = request.Temperature > 0 ? request.Temperature : _settings.Temperature,
            system = systemContent,
            messages,
            stream
        };
    }

    // Response models
    private class ClaudeResponse
    {
        public List<ClaudeContent>? Content { get; set; }
        public ClaudeUsage? Usage { get; set; }
    }

    private class ClaudeContent
    {
        public string? Type { get; set; }
        public string? Text { get; set; }
    }

    private class ClaudeUsage
    {
        public int InputTokens { get; set; }
        public int OutputTokens { get; set; }
    }

    private class ClaudeStreamEvent
    {
        public string? Type { get; set; }
        public ClaudeDelta? Delta { get; set; }
        public ClaudeUsage? Usage { get; set; }
    }

    private class ClaudeDelta
    {
        public string? Type { get; set; }
        public string? Text { get; set; }
    }
}
