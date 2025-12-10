using PharmaGo.Chat.Grpc.Configurations;
using PharmaGo.Chat.Grpc.Services.AI;
using StackExchange.Redis;
using System.Runtime.CompilerServices;
using System.Text.Json;

namespace PharmaGo.Chat.Grpc.Services.Chat;

public class RedisCacheService : IChatCacheService
{
    private readonly IConnectionMultiplexer _redis;
    private readonly IDatabase _db;
    private readonly RedisSettings _settings;
    private readonly ILogger<RedisCacheService> _logger;

    private const string SessionPrefix = "chat:session:";
    private const string HistoryPrefix = "chat:history:";
    private const string ChannelPrefix = "chat:channel:";

    public RedisCacheService(
        IConnectionMultiplexer redis,
        ChatSettings settings,
        ILogger<RedisCacheService> logger)
    {
        _redis = redis;
        _db = redis.GetDatabase();
        _settings = settings.Redis;
        _logger = logger;
    }

    public async Task<bool> CreateSessionAsync(string sessionId, string userName, string userEmail, Dictionary<string, string>? metadata = null)
    {
        var session = new SessionCacheData
        {
            SessionId = sessionId,
            UserName = userName,
            UserEmail = userEmail,
            Status = "active",
            CreatedAt = DateTime.UtcNow,
            LastActivity = DateTime.UtcNow,
            MessageCount = 0,
            TotalTokens = 0,
            Metadata = metadata ?? new Dictionary<string, string>()
        };

        var key = SessionPrefix + sessionId;
        var json = JsonSerializer.Serialize(session);
        var expiry = TimeSpan.FromMinutes(_settings.SessionExpirationMinutes);

        var result = await _db.StringSetAsync(key, json, expiry);
        _logger.LogDebug("Created session {SessionId} in Redis: {Result}", sessionId, result);

        return result;
    }

    public async Task<SessionCacheData?> GetSessionAsync(string sessionId)
    {
        var key = SessionPrefix + sessionId;
        var json = await _db.StringGetAsync(key);

        if (json.IsNullOrEmpty)
        {
            return null;
        }

        return JsonSerializer.Deserialize<SessionCacheData>(json!.ToString().AsSpan());
    }

    public async Task UpdateSessionActivityAsync(string sessionId)
    {
        var session = await GetSessionAsync(sessionId);
        if (session != null)
        {
            session.LastActivity = DateTime.UtcNow;
            var key = SessionPrefix + sessionId;
            var json = JsonSerializer.Serialize(session);
            var expiry = TimeSpan.FromMinutes(_settings.SessionExpirationMinutes);
            await _db.StringSetAsync(key, json, expiry);
        }
    }

    public async Task EndSessionAsync(string sessionId)
    {
        var session = await GetSessionAsync(sessionId);
        if (session != null)
        {
            session.Status = "ended";
            var key = SessionPrefix + sessionId;
            var json = JsonSerializer.Serialize(session);
            // Keep ended sessions for a shorter time
            var expiry = TimeSpan.FromHours(1);
            await _db.StringSetAsync(key, json, expiry);
        }
    }

    public async Task<bool> SessionExistsAsync(string sessionId)
    {
        var key = SessionPrefix + sessionId;
        return await _db.KeyExistsAsync(key);
    }

    public async Task AddMessageAsync(string sessionId, AIMessage message)
    {
        var key = HistoryPrefix + sessionId;
        var json = JsonSerializer.Serialize(message);
        var expiry = TimeSpan.FromHours(_settings.HistoryExpirationHours);

        await _db.ListRightPushAsync(key, json);
        await _db.KeyExpireAsync(key, expiry);

        _logger.LogDebug("Added message to history for session {SessionId}", sessionId);
    }

    public async Task<List<AIMessage>> GetHistoryAsync(string sessionId, int limit = 50)
    {
        var key = HistoryPrefix + sessionId;
        var messages = new List<AIMessage>();

        var values = limit > 0
            ? await _db.ListRangeAsync(key, -limit, -1)
            : await _db.ListRangeAsync(key);

        foreach (var value in values)
        {
            if (!value.IsNullOrEmpty)
            {
                var message = JsonSerializer.Deserialize<AIMessage>(value!.ToString().AsSpan());
                if (message != null)
                {
                    messages.Add(message);
                }
            }
        }

        return messages;
    }

    public async Task ClearHistoryAsync(string sessionId)
    {
        var key = HistoryPrefix + sessionId;
        await _db.KeyDeleteAsync(key);
    }

    public async Task IncrementMessageCountAsync(string sessionId)
    {
        var session = await GetSessionAsync(sessionId);
        if (session != null)
        {
            session.MessageCount++;
            session.LastActivity = DateTime.UtcNow;
            var key = SessionPrefix + sessionId;
            var json = JsonSerializer.Serialize(session);
            var expiry = TimeSpan.FromMinutes(_settings.SessionExpirationMinutes);
            await _db.StringSetAsync(key, json, expiry);
        }
    }

    public async Task AddTokensUsedAsync(string sessionId, int tokens)
    {
        var session = await GetSessionAsync(sessionId);
        if (session != null)
        {
            session.TotalTokens += tokens;
            var key = SessionPrefix + sessionId;
            var json = JsonSerializer.Serialize(session);
            var expiry = TimeSpan.FromMinutes(_settings.SessionExpirationMinutes);
            await _db.StringSetAsync(key, json, expiry);
        }
    }

    public async Task SetTransferredAsync(string sessionId, string operatorId)
    {
        var session = await GetSessionAsync(sessionId);
        if (session != null)
        {
            session.Status = "transferred";
            session.OperatorId = operatorId;
            var key = SessionPrefix + sessionId;
            var json = JsonSerializer.Serialize(session);
            var expiry = TimeSpan.FromMinutes(_settings.SessionExpirationMinutes);
            await _db.StringSetAsync(key, json, expiry);
        }
    }

    public async Task ClearTransferredAsync(string sessionId)
    {
        var session = await GetSessionAsync(sessionId);
        if (session != null)
        {
            session.Status = "active";
            session.OperatorId = null;
            var key = SessionPrefix + sessionId;
            var json = JsonSerializer.Serialize(session);
            var expiry = TimeSpan.FromMinutes(_settings.SessionExpirationMinutes);
            await _db.StringSetAsync(key, json, expiry);
        }
    }

    public async Task PublishMessageAsync(string channel, string message)
    {
        var subscriber = _redis.GetSubscriber();
        await subscriber.PublishAsync(RedisChannel.Literal(ChannelPrefix + channel), message);
    }

    public async IAsyncEnumerable<string> SubscribeAsync(
        string channel,
        [EnumeratorCancellation] CancellationToken cancellationToken)
    {
        var subscriber = _redis.GetSubscriber();
        var channelKey = RedisChannel.Literal(ChannelPrefix + channel);
        var queue = await subscriber.SubscribeAsync(channelKey);

        try
        {
            while (!cancellationToken.IsCancellationRequested)
            {
                var message = await queue.ReadAsync(cancellationToken);
                if (!message.Message.IsNullOrEmpty)
                {
                    yield return message.Message!;
                }
            }
        }
        finally
        {
            await subscriber.UnsubscribeAsync(channelKey);
        }
    }
}
