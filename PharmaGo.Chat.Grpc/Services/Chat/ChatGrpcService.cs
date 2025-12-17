using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Configurations;
using PharmaGo.Chat.Grpc.Data.Context;
using PharmaGo.Chat.Grpc.Models.Entities;
using PharmaGo.Chat.Grpc.Protos;
using PharmaGo.Chat.Grpc.Services.AI;
using PharmaGo.Chat.Grpc.Services.Prompts;
using PharmaGo.Chat.Grpc.Services.RAG;
using System.Text.Json;

namespace PharmaGo.Chat.Grpc.Services.Chat;

public class ChatGrpcService : ChatService.ChatServiceBase
{
    private readonly IChatCacheService _cacheService;
    private readonly IAIServiceFactory _aiServiceFactory;
    private readonly IRagService _ragService;
    private readonly IPromptCacheService _promptCacheService;
    private readonly ChatDbContext _dbContext;
    private readonly SessionSettings _sessionSettings;
    private readonly ILogger<ChatGrpcService> _logger;

    public ChatGrpcService(
        IChatCacheService cacheService,
        IAIServiceFactory aiServiceFactory,
        IRagService ragService,
        IPromptCacheService promptCacheService,
        ChatDbContext dbContext,
        ChatSettings settings,
        ILogger<ChatGrpcService> logger)
    {
        _cacheService = cacheService;
        _aiServiceFactory = aiServiceFactory;
        _ragService = ragService;
        _promptCacheService = promptCacheService;
        _dbContext = dbContext;
        _sessionSettings = settings.Session;
        _logger = logger;
    }

    public override async Task<ChatCreateSessionResponse> CreateSession(ChatCreateSessionRequest request, ServerCallContext context)
    {
        var sessionId = Guid.NewGuid().ToString();
        var metadata = request.Metadata.ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
        var language = string.IsNullOrEmpty(request.Language) ? "pt-BR" : request.Language;

        // Get prompt configuration by type from Redis/DB
        var promptData = await _promptCacheService.GetPromptByTypeAsync(request.Type);

        // Create variable replacement context from request
        var variableContext = PromptVariableReplacer.FromCreateSessionRequest(
            request.Name,
            request.Email,
            request.Client,
            request.AgentName,
            string.IsNullOrEmpty(request.ErpName) ? null : request.ErpName,
            language,
            request.Type);

        // Create session in Redis cache with new parameters
        await _cacheService.CreateSessionAsync(
            sessionId,
            request.Name,
            request.Email,
            request.Client,
            request.AgentName,
            string.IsNullOrEmpty(request.ErpName) ? null : request.ErpName,
            language,
            request.Type,
            metadata);

        // Persist to database with new parameters
        var session = new ChatSession
        {
            Id = Guid.Parse(sessionId),
            UserName = request.Name,
            UserEmail = request.Email,
            Client = request.Client,
            AgentName = request.AgentName,
            ErpName = string.IsNullOrEmpty(request.ErpName) ? null : request.ErpName,
            Language = language,
            Type = request.Type,
            Metadata = JsonSerializer.Serialize(metadata)
        };
        _dbContext.Sessions.Add(session);
        await _dbContext.SaveChangesAsync();

        // Add system message with prompt from database (with variable replacement)
        var systemPrompt = PromptVariableReplacer.Replace(promptData?.SystemPrompt, variableContext);
        var systemMessage = new AIMessage
        {
            Role = "system",
            Content = systemPrompt
        };
        await _cacheService.AddMessageAsync(sessionId, systemMessage);

        _logger.LogInformation("Created session {SessionId} for user {UserName}, Client='{Client}', Type='{Type}'",
            sessionId, request.Name, request.Client, request.Type);

        // Replace variables in welcome message
        var welcomeMessage = PromptVariableReplacer.Replace(promptData?.WelcomeMessage, variableContext);

        return new ChatCreateSessionResponse
        {
            SessionId = sessionId,
            CreatedAt = Timestamp.FromDateTime(DateTime.UtcNow),
            WelcomeMessage = welcomeMessage
        };
    }

    public override async Task<ChatSendMessageResponse> SendMessage(ChatSendMessageRequest request, ServerCallContext context)
    {
        // Validate session
        var sessionData = await _cacheService.GetSessionAsync(request.SessionId);
        if (sessionData == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Session not found"));
        }

        // Get prompt configuration by session type from Redis/DB
        var promptData = await _promptCacheService.GetPromptByTypeAsync(sessionData.Type);

        // Create variable replacement context from session data
        var variableContext = PromptVariableReplacer.FromSessionCacheData(sessionData);

        // Get history
        var history = await _cacheService.GetHistoryAsync(request.SessionId, _sessionSettings.MaxHistoryMessages);

        // Add user message to history
        var userMessage = new AIMessage { Role = "user", Content = request.Message };
        await _cacheService.AddMessageAsync(request.SessionId, userMessage);
        history.Add(userMessage);

        // Build RAG context from DocumentEntity using vector similarity search
        // Filter by session type if available
        var typeFilter = string.IsNullOrEmpty(sessionData.Type) ? null : sessionData.Type;
        var ragContext = await _ragService.BuildContextAsync(request.Message, typeFilter);
        var sources = new List<string>();

        if (!string.IsNullOrEmpty(ragContext))
        {
            var searchResults = await _ragService.SearchAsync(request.Message, limit: 5, typeFilter: typeFilter);
            sources = searchResults.Select(r => r.Title).Distinct().ToList();
        }

        // Get AI service and generate response (with variable replacement in system prompt)
        var systemPrompt = PromptVariableReplacer.Replace(promptData?.SystemPrompt, variableContext);
        var aiService = _aiServiceFactory.GetService(request.PreferredModel);
        var aiRequest = new AIRequest
        {
            SystemPrompt = systemPrompt,
            Messages = history,
            Context = ragContext,
            MaxTokens = 4096,
            Temperature = 0.7f
        };

        var aiResponse = await aiService.GenerateResponseAsync(aiRequest, context.CancellationToken);

        // Add assistant response to history
        var assistantMessage = new AIMessage { Role = "assistant", Content = aiResponse.Content };
        await _cacheService.AddMessageAsync(request.SessionId, assistantMessage);

        // Update session stats
        await _cacheService.IncrementMessageCountAsync(request.SessionId);
        await _cacheService.AddTokensUsedAsync(request.SessionId, aiResponse.TokensUsed);
        await _cacheService.UpdateSessionActivityAsync(request.SessionId);

        // Persist message to database
        await PersistMessageAsync(request.SessionId, userMessage, aiResponse);

        _logger.LogDebug("Processed message for session {SessionId}, tokens used: {Tokens}",
            request.SessionId, aiResponse.TokensUsed);

        return new ChatSendMessageResponse
        {
            MessageId = Guid.NewGuid().ToString(),
            Response = aiResponse.Content,
            ModelUsed = aiResponse.ModelUsed,
            TokensUsed = aiResponse.TokensUsed,
            Timestamp = Timestamp.FromDateTime(DateTime.UtcNow),
            Sources = { sources }
        };
    }

    public override async Task SendMessageStream(
        ChatSendMessageRequest request,
        IServerStreamWriter<ChatMessageChunk> responseStream,
        ServerCallContext context)
    {
        // Validate session
        var sessionData = await _cacheService.GetSessionAsync(request.SessionId);
        if (sessionData == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Session not found"));
        }

        // Get prompt configuration by session type from Redis/DB
        var promptData = await _promptCacheService.GetPromptByTypeAsync(sessionData.Type);

        // Create variable replacement context from session data
        var variableContext = PromptVariableReplacer.FromSessionCacheData(sessionData);

        // Get history
        var history = await _cacheService.GetHistoryAsync(request.SessionId, _sessionSettings.MaxHistoryMessages);

        // Add user message to history
        var userMessage = new AIMessage { Role = "user", Content = request.Message };
        await _cacheService.AddMessageAsync(request.SessionId, userMessage);
        history.Add(userMessage);

        // Build RAG context from DocumentEntity using vector similarity search
        // Filter by session type if available
        var typeFilter = string.IsNullOrEmpty(sessionData.Type) ? null : sessionData.Type;
        var ragContext = await _ragService.BuildContextAsync(request.Message, typeFilter);
        var sources = new List<string>();

        if (!string.IsNullOrEmpty(ragContext))
        {
            var searchResults = await _ragService.SearchAsync(request.Message, limit: 5, typeFilter: typeFilter);
            sources = searchResults.Select(r => r.Title).Distinct().ToList();
        }

        // Get AI service (with variable replacement in system prompt)
        var systemPrompt = PromptVariableReplacer.Replace(promptData?.SystemPrompt, variableContext);
        var aiService = _aiServiceFactory.GetService(request.PreferredModel);
        var aiRequest = new AIRequest
        {
            SystemPrompt = systemPrompt,
            Messages = history,
            Context = ragContext,
            MaxTokens = 4096,
            Temperature = 0.7f
        };

        // Stream response
        var fullContent = new System.Text.StringBuilder();
        int totalTokens = 0;
        string modelUsed = string.Empty;

        await foreach (var chunk in aiService.GenerateStreamingResponseAsync(aiRequest, context.CancellationToken))
        {
            fullContent.Append(chunk.Content);
            modelUsed = chunk.ModelUsed;

            if (chunk.IsFinal)
            {
                totalTokens = chunk.TokensUsed;
            }

            await responseStream.WriteAsync(new ChatMessageChunk
            {
                ChunkId = Guid.NewGuid().ToString(),
                Content = chunk.Content,
                IsFinal = chunk.IsFinal,
                ModelUsed = chunk.ModelUsed,
                TokensUsed = chunk.TokensUsed,
                Sources = { chunk.IsFinal ? sources : Enumerable.Empty<string>() }
            });
        }

        // Add assistant response to history
        var assistantMessage = new AIMessage { Role = "assistant", Content = fullContent.ToString() };
        await _cacheService.AddMessageAsync(request.SessionId, assistantMessage);

        // Update session stats
        await _cacheService.IncrementMessageCountAsync(request.SessionId);
        await _cacheService.AddTokensUsedAsync(request.SessionId, totalTokens);
        await _cacheService.UpdateSessionActivityAsync(request.SessionId);

        // Persist to database
        var aiResponse = new AIResponse
        {
            Content = fullContent.ToString(),
            ModelUsed = modelUsed,
            TokensUsed = totalTokens
        };
        await PersistMessageAsync(request.SessionId, userMessage, aiResponse);

        _logger.LogDebug("Streamed message for session {SessionId}, tokens used: {Tokens}",
            request.SessionId, totalTokens);
    }

    public override async Task<ChatGetHistoryResponse> GetHistory(ChatGetHistoryRequest request, ServerCallContext context)
    {
        var sessionGuid = Guid.Parse(request.SessionId);

        var query = _dbContext.Messages
            .AsNoTracking()
            .Where(m => m.SessionId == sessionGuid)
            .OrderBy(m => m.Timestamp);

        var totalCount = await query.CountAsync();

        var messagesQuery = query.AsQueryable();
        if (request.Offset > 0)
        {
            messagesQuery = messagesQuery.Skip(request.Offset);
        }
        if (request.Limit > 0)
        {
            messagesQuery = messagesQuery.Take(request.Limit);
        }

        var messages = await messagesQuery.ToListAsync();

        var response = new ChatGetHistoryResponse { TotalCount = totalCount };

        foreach (var msg in messages)
        {
            response.Messages.Add(new ChatMessage
            {
                MessageId = msg.Id.ToString(),
                Role = msg.Role,
                Content = msg.Content,
                Timestamp = Timestamp.FromDateTime(msg.Timestamp.ToUniversalTime()),
                ModelUsed = msg.ModelUsed ?? string.Empty,
                TokensUsed = msg.TokensUsed
            });
        }

        return response;
    }

    public override async Task<ChatEndSessionResponse> EndSession(ChatEndSessionRequest request, ServerCallContext context)
    {
        var sessionGuid = Guid.Parse(request.SessionId);

        // Get session from database
        var session = await _dbContext.Sessions.FirstOrDefaultAsync(s => s.Id == sessionGuid);
        if (session == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Session not found"));
        }

        // Update session status
        session.Status = "ended";
        session.EndedAt = DateTime.UtcNow;
        await _dbContext.SaveChangesAsync();

        // End session in cache
        await _cacheService.EndSessionAsync(request.SessionId);

        _logger.LogInformation("Ended session {SessionId}", request.SessionId);

        return new ChatEndSessionResponse
        {
            Success = true,
            EndedAt = Timestamp.FromDateTime(DateTime.UtcNow),
            TotalMessages = session.MessageCount,
            TotalTokens = session.TotalTokens
        };
    }

    public override async Task<ChatSessionInfo> GetSessionInfo(ChatGetSessionInfoRequest request, ServerCallContext context)
    {
        var sessionGuid = Guid.Parse(request.SessionId);
        var session = await _dbContext.Sessions.AsNoTracking().FirstOrDefaultAsync(s => s.Id == sessionGuid);

        if (session == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Session not found"));
        }

        var metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(session.Metadata.AsSpan()) ?? new();

        var response = new ChatSessionInfo
        {
            SessionId = session.Id.ToString(),
            UserName = session.UserName,
            UserEmail = session.UserEmail,
            Status = session.Status,
            CreatedAt = Timestamp.FromDateTime(session.CreatedAt.ToUniversalTime()),
            LastActivity = Timestamp.FromDateTime(session.LastActivity.ToUniversalTime()),
            MessageCount = session.MessageCount,
            TotalTokens = session.TotalTokens,
            CurrentOperatorId = session.CurrentOperatorId ?? string.Empty,
            Client = session.Client,
            AgentName = session.AgentName,
            ErpName = session.ErpName ?? string.Empty,
            Language = session.Language,
            Type = session.Type
        };

        foreach (var kvp in metadata)
        {
            response.Metadata.Add(kvp.Key, kvp.Value);
        }

        return response;
    }

    public override async Task<ChatListActiveSessionsResponse> ListActiveSessions(ChatListActiveSessionsRequest request, ServerCallContext context)
    {
        var query = _dbContext.Sessions.AsNoTracking().Where(s => s.Status != "ended");

        if (!string.IsNullOrEmpty(request.StatusFilter))
        {
            query = query.Where(s => s.Status == request.StatusFilter);
        }

        var totalCount = await query.CountAsync();

        var sessions = await query
            .OrderByDescending(s => s.LastActivity)
            .Skip(request.Offset)
            .Take(request.Limit > 0 ? request.Limit : 50)
            .ToListAsync();

        var response = new ChatListActiveSessionsResponse { TotalCount = totalCount };

        foreach (var session in sessions)
        {
            var metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(session.Metadata.AsSpan()) ?? new();
            var info = new ChatSessionInfo
            {
                SessionId = session.Id.ToString(),
                UserName = session.UserName,
                UserEmail = session.UserEmail,
                Status = session.Status,
                CreatedAt = Timestamp.FromDateTime(session.CreatedAt.ToUniversalTime()),
                LastActivity = Timestamp.FromDateTime(session.LastActivity.ToUniversalTime()),
                MessageCount = session.MessageCount,
                TotalTokens = session.TotalTokens,
                CurrentOperatorId = session.CurrentOperatorId ?? string.Empty,
                Client = session.Client,
                AgentName = session.AgentName,
                ErpName = session.ErpName ?? string.Empty,
                Language = session.Language,
                Type = session.Type
            };

            foreach (var kvp in metadata)
            {
                info.Metadata.Add(kvp.Key, kvp.Value);
            }

            response.Sessions.Add(info);
        }

        return response;
    }

    private async Task PersistMessageAsync(string sessionId, AIMessage userMessage, AIResponse aiResponse)
    {
        var sessionGuid = Guid.Parse(sessionId);

        // User message
        var userEntity = new ChatMessageEntity
        {
            SessionId = sessionGuid,
            Role = "user",
            Content = userMessage.Content
        };
        _dbContext.Messages.Add(userEntity);

        // Assistant message
        var assistantEntity = new ChatMessageEntity
        {
            SessionId = sessionGuid,
            Role = "assistant",
            Content = aiResponse.Content,
            ModelUsed = aiResponse.ModelUsed,
            TokensUsed = aiResponse.TokensUsed
        };
        _dbContext.Messages.Add(assistantEntity);

        // Update session stats
        var session = await _dbContext.Sessions.FirstOrDefaultAsync(s => s.Id == sessionGuid);
        if (session != null)
        {
            session.MessageCount += 2;
            session.TotalTokens += aiResponse.TokensUsed;
            session.LastActivity = DateTime.UtcNow;

            // Save to Redis user history (180 days TTL)
            var userHistoryMessage = new UserHistoryMessage
            {
                Role = "user",
                Content = userMessage.Content,
                Timestamp = DateTime.UtcNow
            };
            await _cacheService.AddMessageToUserHistoryAsync(session.UserEmail, sessionId, userHistoryMessage);

            var assistantHistoryMessage = new UserHistoryMessage
            {
                Role = "assistant",
                Content = aiResponse.Content,
                Timestamp = DateTime.UtcNow,
                ModelUsed = aiResponse.ModelUsed,
                TokensUsed = aiResponse.TokensUsed
            };
            await _cacheService.AddMessageToUserHistoryAsync(session.UserEmail, sessionId, assistantHistoryMessage);
        }

        await _dbContext.SaveChangesAsync();
    }

    public override async Task<ChatGetHistoryByEmailResponse> GetHistoryByEmail(ChatGetHistoryByEmailRequest request, ServerCallContext context)
    {
        var limit = request.Limit > 0 ? request.Limit : 10;
        var messages = await _cacheService.GetUserHistoryAsync(request.UserEmail, limit);

        var response = new ChatGetHistoryByEmailResponse
        {
            TotalCount = messages.Count,
            WelcomeMessageInserted = false
        };

        foreach (var msg in messages)
        {
            response.Messages.Add(new ChatHistoryMessage
            {
                MessageId = msg.MessageId,
                Role = msg.Role,
                Content = msg.Content,
                Timestamp = Timestamp.FromDateTime(msg.Timestamp.ToUniversalTime()),
                ModelUsed = msg.ModelUsed ?? string.Empty,
                TokensUsed = msg.TokensUsed,
                SessionId = msg.SessionId
            });
        }

        // Check if we need to insert a welcome message (> 60 minutes since last message)
        if (messages.Count > 0 && !string.IsNullOrEmpty(request.Type))
        {
            var lastMessage = messages[^1]; // Last message (most recent)
            var timeSinceLastMessage = DateTime.UtcNow - lastMessage.Timestamp.ToUniversalTime();

            if (timeSinceLastMessage.TotalMinutes > 60)
            {
                // Get welcome message from prompt cache
                var promptData = await _promptCacheService.GetPromptByTypeAsync(request.Type);

                if (promptData != null && !string.IsNullOrEmpty(promptData.WelcomeMessage))
                {
                    // Create variable context for replacement (using available info from request)
                    var variableContext = new PromptVariableContext
                    {
                        Type = request.Type,
                        UserEmail = request.UserEmail
                    };

                    var welcomeMessage = PromptVariableReplacer.Replace(promptData.WelcomeMessage, variableContext);

                    // Insert welcome message at the end of the history
                    response.Messages.Add(new ChatHistoryMessage
                    {
                        MessageId = Guid.NewGuid().ToString(),
                        Role = "assistant",
                        Content = welcomeMessage,
                        Timestamp = Timestamp.FromDateTime(DateTime.UtcNow),
                        ModelUsed = string.Empty,
                        TokensUsed = 0,
                        SessionId = string.Empty // No session association for auto-inserted message
                    });

                    response.WelcomeMessageInserted = true;
                    response.TotalCount++;

                    _logger.LogInformation(
                        "Inserted welcome message for user {UserEmail} due to {Minutes} minutes of inactivity",
                        request.UserEmail,
                        (int)timeSinceLastMessage.TotalMinutes);
                }
            }
        }

        _logger.LogDebug("Retrieved {Count} messages from user history for email {UserEmail}",
            messages.Count, request.UserEmail);

        return response;
    }
}
