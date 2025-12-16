namespace PharmaGo.Chat.Grpc.Services.Prompts;

public interface IPromptCacheService
{
    /// <summary>
    /// Gets prompt data by type. First checks Redis cache, then falls back to database.
    /// If type is not found, returns the "default" type prompt.
    /// </summary>
    Task<PromptCacheData?> GetPromptByTypeAsync(string type);

    /// <summary>
    /// Sets or updates the cache for a specific prompt.
    /// Use this after saving/updating a prompt in the database to ensure immediate synchronization.
    /// </summary>
    Task SetCacheAsync(string type, PromptCacheData data);

    /// <summary>
    /// Invalidates the cache for a specific type.
    /// </summary>
    Task InvalidateCacheAsync(string type);

    /// <summary>
    /// Invalidates all prompt caches.
    /// </summary>
    Task InvalidateAllCachesAsync();
}

public class PromptCacheData
{
    public Guid Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Type { get; set; } = string.Empty;
    public string SystemPrompt { get; set; } = string.Empty;
    public string WelcomeMessage { get; set; } = string.Empty;
}
