using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Configurations;
using PharmaGo.Chat.Grpc.Data.Context;
using StackExchange.Redis;
using System.Text.Json;

namespace PharmaGo.Chat.Grpc.Services.Prompts;

public class PromptCacheService : IPromptCacheService
{
    private readonly IConnectionMultiplexer _redis;
    private readonly IDatabase _db;
    private readonly ChatDbContext _dbContext;
    private readonly ILogger<PromptCacheService> _logger;

    private const string PromptCachePrefix = "chat:prompt:";
    private const int CacheExpirationHours = 24;
    private const string DefaultType = "default";

    // Default fallback values when no prompt is found
    private const string DefaultSystemPrompt = "Voce e um assistente virtual amigavel e profissional da PharmaGO, um sistema de gestao para farmacias. Responda de forma clara, concisa e util. Se nao souber a resposta, seja honesto e sugira entrar em contato com o suporte humano.";
    private const string DefaultWelcomeMessage = "Ola! Sou o assistente virtual da PharmaGO. Como posso ajuda-lo hoje?";

    public PromptCacheService(
        IConnectionMultiplexer redis,
        ChatDbContext dbContext,
        ILogger<PromptCacheService> logger)
    {
        _redis = redis;
        _db = redis.GetDatabase();
        _dbContext = dbContext;
        _logger = logger;
    }

    public async Task<PromptCacheData?> GetPromptByTypeAsync(string type)
    {
        if (string.IsNullOrEmpty(type))
        {
            type = DefaultType;
        }

        var normalizedType = type.ToLowerInvariant();

        // Try to get from Redis cache first
        var cached = await GetFromCacheAsync(normalizedType);
        if (cached != null)
        {
            _logger.LogDebug("Prompt for type '{Type}' found in cache", normalizedType);
            return cached;
        }

        // Not in cache, try to get from database
        var prompt = await GetFromDatabaseAsync(normalizedType);
        if (prompt != null)
        {
            await SetCacheAsync(normalizedType, prompt);
            _logger.LogDebug("Prompt for type '{Type}' loaded from database and cached", normalizedType);
            return prompt;
        }

        // If type not found, try default type
        if (normalizedType != DefaultType)
        {
            _logger.LogDebug("Prompt for type '{Type}' not found, trying default type", normalizedType);

            cached = await GetFromCacheAsync(DefaultType);
            if (cached != null)
            {
                return cached;
            }

            prompt = await GetFromDatabaseAsync(DefaultType);
            if (prompt != null)
            {
                await SetCacheAsync(DefaultType, prompt);
                return prompt;
            }
        }

        // Return hardcoded default as last resort
        _logger.LogWarning("No prompt found for type '{Type}' or default type, using hardcoded defaults", normalizedType);
        return new PromptCacheData
        {
            Id = Guid.Empty,
            Name = "Default",
            Type = DefaultType,
            SystemPrompt = DefaultSystemPrompt,
            WelcomeMessage = DefaultWelcomeMessage
        };
    }

    public async Task InvalidateCacheAsync(string type)
    {
        var key = PromptCachePrefix + type.ToLowerInvariant();
        await _db.KeyDeleteAsync(key);
        _logger.LogInformation("Cache invalidated for prompt type '{Type}'", type);
    }

    public async Task InvalidateAllCachesAsync()
    {
        var server = _redis.GetServer(_redis.GetEndPoints().First());
        var keys = server.Keys(pattern: PromptCachePrefix + "*").ToArray();

        foreach (var key in keys)
        {
            await _db.KeyDeleteAsync(key);
        }

        _logger.LogInformation("All prompt caches invalidated ({Count} keys)", keys.Length);
    }

    private async Task<PromptCacheData?> GetFromCacheAsync(string type)
    {
        var key = PromptCachePrefix + type;
        var json = await _db.StringGetAsync(key);

        if (json.IsNullOrEmpty)
        {
            return null;
        }

        return JsonSerializer.Deserialize<PromptCacheData>(json!.ToString().AsSpan());
    }

    public async Task SetCacheAsync(string type, PromptCacheData data)
    {
        var key = PromptCachePrefix + type;
        var json = JsonSerializer.Serialize(data);
        var expiry = TimeSpan.FromHours(CacheExpirationHours);
        await _db.StringSetAsync(key, json, expiry);
    }

    private async Task<PromptCacheData?> GetFromDatabaseAsync(string type)
    {
        var entity = await _dbContext.ChatPrompts
            .AsNoTracking()
            .FirstOrDefaultAsync(p => p.Type.ToLower() == type);

        if (entity == null)
        {
            return null;
        }

        return new PromptCacheData
        {
            Id = entity.Id,
            Name = entity.Name,
            Type = entity.Type,
            SystemPrompt = entity.Prompt,
            WelcomeMessage = entity.WelcomeMessage
        };
    }
}
