using System.Text.Json;
using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Data.Context;
using PharmaGo.Chat.Grpc.Models.Entities;
using PharmaGo.Chat.Grpc.Protos;
using PharmaGo.Chat.Grpc.Services.Chat;

namespace PharmaGo.Chat.Grpc.Services.Support;

public class SupportGrpcService : SupportService.SupportServiceBase
{
    private readonly ChatDbContext _dbContext;
    private readonly IChatCacheService _cacheService;
    private readonly ILogger<SupportGrpcService> _logger;

    public SupportGrpcService(
        ChatDbContext dbContext,
        IChatCacheService cacheService,
        ILogger<SupportGrpcService> logger)
    {
        _dbContext = dbContext;
        _cacheService = cacheService;
        _logger = logger;
    }

    public override async Task<SupportRequestTransferResponse> RequestTransfer(SupportRequestTransferRequest request, ServerCallContext context)
    {
        var sessionGuid = Guid.Parse(request.SessionId);
        var session = await _dbContext.Sessions.FirstOrDefaultAsync(s => s.Id == sessionGuid);

        if (session == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Session not found"));
        }

        // Create transfer request
        var transfer = new TransferRequestEntity
        {
            SessionId = sessionGuid,
            Reason = request.Reason,
            Priority = request.Priority > 0 ? request.Priority : 3
        };

        _dbContext.TransferRequests.Add(transfer);

        // Update session status
        session.Status = "awaiting_transfer";
        await _dbContext.SaveChangesAsync();

        // Calculate queue position
        var queuePosition = await _dbContext.TransferRequests
            .CountAsync(t => t.Status == "pending" && t.RequestedAt < transfer.RequestedAt) + 1;

        // Estimate wait time (average 5 min per position)
        var estimatedWait = $"{queuePosition * 5} minutos";

        _logger.LogInformation("Transfer requested for session {SessionId}, position: {Position}",
            request.SessionId, queuePosition);

        return new SupportRequestTransferResponse
        {
            TransferId = transfer.Id.ToString(),
            QueuePosition = queuePosition,
            EstimatedWait = estimatedWait,
            RequestedAt = Timestamp.FromDateTime(transfer.RequestedAt.ToUniversalTime())
        };
    }

    public override async Task<SupportAcceptTransferResponse> AcceptTransfer(SupportAcceptTransferRequest request, ServerCallContext context)
    {
        var transferGuid = Guid.Parse(request.TransferId);
        var transfer = await _dbContext.TransferRequests
            .Include(t => t.Session)
            .FirstOrDefaultAsync(t => t.Id == transferGuid);

        if (transfer == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Transfer request not found"));
        }

        if (transfer.Status != "pending")
        {
            throw new RpcException(new Status(StatusCode.FailedPrecondition, "Transfer already processed"));
        }

        // Update transfer
        transfer.Status = "accepted";
        transfer.AcceptedAt = DateTime.UtcNow;
        transfer.OperatorId = request.OperatorId;
        transfer.OperatorName = request.OperatorName;

        // Update session
        transfer.Session.Status = "transferred";
        transfer.Session.CurrentOperatorId = request.OperatorId;

        await _dbContext.SaveChangesAsync();

        // Update Redis cache
        await _cacheService.SetTransferredAsync(transfer.SessionId.ToString(), request.OperatorId);

        // Get message history
        var messages = await _dbContext.Messages
            .AsNoTracking()
            .Where(m => m.SessionId == transfer.SessionId)
            .OrderBy(m => m.Timestamp)
            .Select(m => new SupportChatMessage
            {
                MessageId = m.Id.ToString(),
                Role = m.Role,
                Content = m.Content,
                Timestamp = Timestamp.FromDateTime(m.Timestamp.ToUniversalTime()),
                ModelUsed = m.ModelUsed ?? string.Empty,
                TokensUsed = m.TokensUsed
            })
            .ToListAsync();

        _logger.LogInformation("Transfer {TransferId} accepted by operator {OperatorId}",
            request.TransferId, request.OperatorId);

        return new SupportAcceptTransferResponse
        {
            Success = true,
            SessionId = transfer.SessionId.ToString(),
            UserName = transfer.Session.UserName,
            UserEmail = transfer.Session.UserEmail,
            History = { messages },
            AcceptedAt = Timestamp.FromDateTime(DateTime.UtcNow)
        };
    }

    public override async Task<SupportEndSupportSessionResponse> EndSupportSession(SupportEndSupportSessionRequest request, ServerCallContext context)
    {
        var sessionGuid = Guid.Parse(request.SessionId);
        var session = await _dbContext.Sessions.FirstOrDefaultAsync(s => s.Id == sessionGuid);

        if (session == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Session not found"));
        }

        // Find active transfer
        var transfer = await _dbContext.TransferRequests
            .Where(t => t.SessionId == sessionGuid && t.Status == "accepted")
            .OrderByDescending(t => t.AcceptedAt)
            .FirstOrDefaultAsync();

        var startTime = transfer?.AcceptedAt ?? session.LastActivity;
        var duration = (int)(DateTime.UtcNow - startTime).TotalSeconds;

        // Update transfer if exists
        if (transfer != null)
        {
            transfer.Status = "completed";
            transfer.CompletedAt = DateTime.UtcNow;
            transfer.Resolution = request.Resolution;
            transfer.Notes = request.Notes;
        }

        // Update session based on resolution
        switch (request.Resolution.ToLowerInvariant())
        {
            case "returned_to_bot":
                session.Status = "active";
                session.CurrentOperatorId = null;
                await _cacheService.ClearTransferredAsync(request.SessionId);
                break;
            case "closed":
            case "resolved":
            default:
                session.Status = "ended";
                session.EndedAt = DateTime.UtcNow;
                session.CurrentOperatorId = null;
                await _cacheService.EndSessionAsync(request.SessionId);
                break;
        }

        await _dbContext.SaveChangesAsync();

        _logger.LogInformation("Support session {SessionId} ended by {OperatorId}, resolution: {Resolution}",
            request.SessionId, request.OperatorId, request.Resolution);

        return new SupportEndSupportSessionResponse
        {
            Success = true,
            EndedAt = Timestamp.FromDateTime(DateTime.UtcNow),
            SupportDurationSeconds = duration
        };
    }

    public override async Task<SupportSendSupportMessageResponse> SendSupportMessage(SupportSendSupportMessageRequest request, ServerCallContext context)
    {
        var sessionGuid = Guid.Parse(request.SessionId);
        var session = await _dbContext.Sessions.FirstOrDefaultAsync(s => s.Id == sessionGuid);

        if (session == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Session not found"));
        }

        // Determine role based on sender type
        var role = request.SenderType == "operator" ? "operator" : "user";

        // Persist message
        var message = new ChatMessageEntity
        {
            SessionId = sessionGuid,
            Role = role,
            Content = request.Message,
            SenderId = request.SenderId,
            SenderName = request.SenderType == "operator" ? session.CurrentOperatorId : session.UserName
        };

        _dbContext.Messages.Add(message);
        session.MessageCount++;
        session.LastActivity = DateTime.UtcNow;

        await _dbContext.SaveChangesAsync();

        // Publish to Redis for real-time delivery
        var pubMessage = JsonSerializer.Serialize(new
        {
            MessageId = message.Id.ToString(),
            SessionId = request.SessionId,
            SenderId = request.SenderId,
            SenderType = request.SenderType,
            Content = request.Message,
            Timestamp = DateTime.UtcNow
        });

        await _cacheService.PublishMessageAsync($"support:{request.SessionId}", pubMessage);

        return new SupportSendSupportMessageResponse
        {
            MessageId = message.Id.ToString(),
            Timestamp = Timestamp.FromDateTime(DateTime.UtcNow),
            Delivered = true
        };
    }

    public override async Task StreamSupportMessages(
        SupportStreamSupportMessagesRequest request,
        IServerStreamWriter<SupportMessage> responseStream,
        ServerCallContext context)
    {
        var channel = $"support:{request.SessionId}";

        await foreach (var messageJson in _cacheService.SubscribeAsync(channel, context.CancellationToken))
        {
            try
            {
                var data = JsonSerializer.Deserialize<SupportMessageData>(messageJson.AsSpan());
                if (data != null)
                {
                    await responseStream.WriteAsync(new SupportMessage
                    {
                        MessageId = data.MessageId,
                        SessionId = data.SessionId,
                        SenderId = data.SenderId,
                        SenderType = data.SenderType,
                        SenderName = data.SenderName ?? string.Empty,
                        Content = data.Content,
                        Timestamp = Timestamp.FromDateTime(data.Timestamp.ToUniversalTime()),
                        MessageType = "text"
                    });
                }
            }
            catch (JsonException ex)
            {
                _logger.LogWarning(ex, "Failed to deserialize support message");
            }
        }
    }

    public override async Task<SupportListPendingTransfersResponse> ListPendingTransfers(SupportListPendingTransfersRequest request, ServerCallContext context)
    {
        var query = _dbContext.TransferRequests
            .AsNoTracking()
            .Include(t => t.Session)
            .Where(t => t.Status == "pending");

        var totalCount = await query.CountAsync();

        var transfers = await query
            .OrderByDescending(t => t.Priority)
            .ThenBy(t => t.RequestedAt)
            .Skip(request.Offset)
            .Take(request.Limit > 0 ? request.Limit : 50)
            .ToListAsync();

        var response = new SupportListPendingTransfersResponse { TotalCount = totalCount };

        foreach (var transfer in transfers)
        {
            // Get last message
            var lastMessage = await _dbContext.Messages
                .AsNoTracking()
                .Where(m => m.SessionId == transfer.SessionId && m.Role == "user")
                .OrderByDescending(m => m.Timestamp)
                .Select(m => m.Content)
                .FirstOrDefaultAsync() ?? string.Empty;

            response.Transfers.Add(new SupportTransferRequest
            {
                TransferId = transfer.Id.ToString(),
                SessionId = transfer.SessionId.ToString(),
                UserName = transfer.Session.UserName,
                UserEmail = transfer.Session.UserEmail,
                Reason = transfer.Reason,
                Priority = transfer.Priority,
                RequestedAt = Timestamp.FromDateTime(transfer.RequestedAt.ToUniversalTime()),
                WaitTimeSeconds = (int)(DateTime.UtcNow - transfer.RequestedAt).TotalSeconds,
                LastMessage = lastMessage.Length > 200 ? lastMessage[..200] + "..." : lastMessage
            });
        }

        return response;
    }

    public override async Task<SupportQueueStatusResponse> GetQueueStatus(Empty request, ServerCallContext context)
    {
        var pendingTransfers = await _dbContext.TransferRequests
            .CountAsync(t => t.Status == "pending");

        var activeSupportSessions = await _dbContext.Sessions
            .CountAsync(s => s.Status == "transferred");

        // Average wait time for completed transfers in last hour
        var recentTransfers = await _dbContext.TransferRequests
            .Where(t => t.Status == "accepted" && t.AcceptedAt > DateTime.UtcNow.AddHours(-1))
            .Select(t => (t.AcceptedAt!.Value - t.RequestedAt).TotalSeconds)
            .ToListAsync();

        var avgWaitTime = recentTransfers.Count > 0 ? (float)recentTransfers.Average() : 0;

        return new SupportQueueStatusResponse
        {
            PendingTransfers = pendingTransfers,
            ActiveSupportSessions = activeSupportSessions,
            AvailableOperators = 0, // Would need operator management system
            AverageWaitTimeSeconds = avgWaitTime
        };
    }

    private class SupportMessageData
    {
        public string MessageId { get; set; } = string.Empty;
        public string SessionId { get; set; } = string.Empty;
        public string SenderId { get; set; } = string.Empty;
        public string SenderType { get; set; } = string.Empty;
        public string? SenderName { get; set; }
        public string Content { get; set; } = string.Empty;
        public DateTime Timestamp { get; set; }
    }
}
