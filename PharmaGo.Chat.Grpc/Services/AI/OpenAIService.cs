using PharmaGo.Chat.Grpc.Configurations;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace PharmaGo.Chat.Grpc.Services.AI;

public class OpenAIService : IAIService
{
    private readonly HttpClient _httpClient;
    private readonly OpenAISettings _settings;
    private readonly EmbeddingSettings _embeddingSettings;
    private readonly ILogger<OpenAIService> _logger;
    private readonly string _modelKey;

    public string ModelName => _modelKey;

    public OpenAIService(
        HttpClient httpClient,
        ChatSettings settings,
        ILogger<OpenAIService> logger,
        string modelKey = "gpt-4.1")
    {
        _httpClient = httpClient;
        _settings = settings.AI.OpenAI;
        _embeddingSettings = settings.Embedding;
        _logger = logger;
        _modelKey = modelKey;

        _httpClient.DefaultRequestHeaders.Add("Authorization", $"Bearer {_settings.ApiKey}");
    }

    public async Task<AIResponse> GenerateResponseAsync(AIRequest request, CancellationToken cancellationToken = default)
    {
        var openAIRequest = BuildRequest(request, stream: false);

        var response = await _httpClient.PostAsJsonAsync(_settings.ApiUrl, openAIRequest, cancellationToken);
        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadFromJsonAsync<OpenAIResponse>(cancellationToken: cancellationToken);

        return new AIResponse
        {
            Content = result?.Choices?.FirstOrDefault()?.Message?.Content ?? string.Empty,
            ModelUsed = GetActualModelName(),
            TokensUsed = result?.Usage?.TotalTokens ?? 0,
            PromptTokens = result?.Usage?.PromptTokens ?? 0,
            CompletionTokens = result?.Usage?.CompletionTokens ?? 0
        };
    }

    public async IAsyncEnumerable<AIResponseChunk> GenerateStreamingResponseAsync(
        AIRequest request,
        [EnumeratorCancellation] CancellationToken cancellationToken = default)
    {
        var openAIRequest = BuildRequest(request, stream: true);
        var jsonContent = JsonSerializer.Serialize(openAIRequest);
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

        var jsonOptions = new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true
        };

        while (!reader.EndOfStream)
        {
            var line = await reader.ReadLineAsync(cancellationToken);
            if (string.IsNullOrEmpty(line)) continue;

            if (line.StartsWith("data: "))
            {
                var jsonData = line[6..];
                if (jsonData == "[DONE]")
                {
                    yield return new AIResponseChunk
                    {
                        Content = string.Empty,
                        IsFinal = true,
                        ModelUsed = GetActualModelName()
                    };
                    break;
                }

                AIResponseChunk? chunk = null;

                try
                {
                    var eventData = JsonSerializer.Deserialize<OpenAIStreamResponse>(jsonData.AsSpan(), jsonOptions);
                    var deltaContent = eventData?.Choices?.FirstOrDefault()?.Delta?.Content;

                    if (!string.IsNullOrEmpty(deltaContent))
                    {
                        chunk = new AIResponseChunk
                        {
                            Content = deltaContent,
                            IsFinal = false,
                            ModelUsed = GetActualModelName()
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

    public async Task<float[]> GenerateEmbeddingAsync(string text, CancellationToken cancellationToken = default)
    {
        var embeddingRequest = new
        {
            model = _embeddingSettings.Model,
            input = text,
            dimensions = _embeddingSettings.Dimensions
        };

        var response = await _httpClient.PostAsJsonAsync(
            "https://api.openai.com/v1/embeddings",
            embeddingRequest,
            cancellationToken);

        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadFromJsonAsync<EmbeddingResponse>(cancellationToken: cancellationToken);
        var embedding = result?.Data?.FirstOrDefault()?.Embedding;

        return embedding ?? Array.Empty<float>();
    }

    private object BuildRequest(AIRequest request, bool stream)
    {
        var messages = new List<object>();

        // Add system message
        var systemContent = request.SystemPrompt;
        if (!string.IsNullOrEmpty(request.Context))
        {
            systemContent += $"\n\n## Contexto Relevante:\n{request.Context}";
        }

        messages.Add(new { role = "system", content = systemContent });

        // Add conversation messages
        foreach (var msg in request.Messages)
        {
            messages.Add(new { role = msg.Role, content = msg.Content });
        }

        return new
        {
            model = GetActualModelName(),
            max_tokens = request.MaxTokens > 0 ? request.MaxTokens : _settings.MaxTokens,
            temperature = request.Temperature > 0 ? request.Temperature : _settings.Temperature,
            messages,
            stream
        };
    }

    private string GetActualModelName()
    {
        return _settings.Models.TryGetValue(_modelKey, out var model) ? model : _modelKey;
    }

    // Response models
    private class OpenAIResponse
    {
        public List<OpenAIChoice>? Choices { get; set; }
        public OpenAIUsage? Usage { get; set; }
    }

    private class OpenAIStreamResponse
    {
        public List<OpenAIStreamChoice>? Choices { get; set; }
    }

    private class OpenAIChoice
    {
        public OpenAIMessage? Message { get; set; }
    }

    private class OpenAIStreamChoice
    {
        public OpenAIDelta? Delta { get; set; }
        [JsonPropertyName("finish_reason")]
        public string? FinishReason { get; set; }
    }

    private class OpenAIMessage
    {
        public string? Role { get; set; }
        public string? Content { get; set; }
    }

    private class OpenAIDelta
    {
        public string? Content { get; set; }
    }

    private class OpenAIUsage
    {
        [JsonPropertyName("prompt_tokens")]
        public int PromptTokens { get; set; }
        [JsonPropertyName("completion_tokens")]
        public int CompletionTokens { get; set; }
        [JsonPropertyName("total_tokens")]
        public int TotalTokens { get; set; }
    }

    private class EmbeddingResponse
    {
        public List<EmbeddingData>? Data { get; set; }
    }

    private class EmbeddingData
    {
        public float[]? Embedding { get; set; }
    }
}
