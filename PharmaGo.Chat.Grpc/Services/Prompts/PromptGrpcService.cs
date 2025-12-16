using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Data.Context;
using PharmaGo.Chat.Grpc.Models.Entities;
using PharmaGo.Chat.Grpc.Protos;

namespace PharmaGo.Chat.Grpc.Services.Prompts;

public class PromptGrpcService : PromptService.PromptServiceBase
{
    private readonly ChatDbContext _dbContext;
    private readonly IPromptCacheService _promptCacheService;
    private readonly ILogger<PromptGrpcService> _logger;

    public PromptGrpcService(
        ChatDbContext dbContext,
        IPromptCacheService promptCacheService,
        ILogger<PromptGrpcService> logger)
    {
        _dbContext = dbContext;
        _promptCacheService = promptCacheService;
        _logger = logger;
    }

    public override async Task<CreatePromptResponse> CreatePrompt(CreatePromptRequest request, ServerCallContext context)
    {
        var entity = new ChatPromptEntity
        {
            Name = request.Name,
            Type = request.Type,
            Prompt = request.Prompt,
            WelcomeMessage = request.WelcomeMessage,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        _dbContext.ChatPrompts.Add(entity);
        await _dbContext.SaveChangesAsync();

        // Sync cache with newly created prompt
        await _promptCacheService.SetCacheAsync(entity.Type.ToLowerInvariant(), new PromptCacheData
        {
            Id = entity.Id,
            Name = entity.Name,
            Type = entity.Type,
            SystemPrompt = entity.Prompt,
            WelcomeMessage = entity.WelcomeMessage
        });

        _logger.LogInformation("Created prompt {Id}: {Name} ({Type}) and synced to Redis cache", entity.Id, entity.Name, entity.Type);

        return new CreatePromptResponse
        {
            Id = entity.Id.ToString(),
            CreatedAt = Timestamp.FromDateTime(entity.CreatedAt.ToUniversalTime())
        };
    }

    public override async Task<UpdatePromptResponse> UpdatePrompt(UpdatePromptRequest request, ServerCallContext context)
    {
        if (!Guid.TryParse(request.Id, out var promptId))
        {
            throw new RpcException(new Status(StatusCode.InvalidArgument, "Invalid prompt ID format"));
        }

        var entity = await _dbContext.ChatPrompts.FirstOrDefaultAsync(p => p.Id == promptId);

        if (entity == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Prompt not found"));
        }

        var oldType = entity.Type;
        entity.Name = request.Name;
        entity.Type = request.Type;
        entity.Prompt = request.Prompt;
        entity.WelcomeMessage = request.WelcomeMessage;
        entity.UpdatedAt = DateTime.UtcNow;

        await _dbContext.SaveChangesAsync();

        // If type changed, invalidate old type cache
        if (oldType != entity.Type)
        {
            await _promptCacheService.InvalidateCacheAsync(oldType.ToLowerInvariant());
        }

        // Sync cache with updated prompt data
        await _promptCacheService.SetCacheAsync(entity.Type.ToLowerInvariant(), new PromptCacheData
        {
            Id = entity.Id,
            Name = entity.Name,
            Type = entity.Type,
            SystemPrompt = entity.Prompt,
            WelcomeMessage = entity.WelcomeMessage
        });

        _logger.LogInformation("Updated prompt {Id}: {Name} ({Type}) and synced to Redis cache", entity.Id, entity.Name, entity.Type);

        return new UpdatePromptResponse
        {
            Success = true,
            UpdatedAt = Timestamp.FromDateTime(entity.UpdatedAt.ToUniversalTime())
        };
    }

    public override async Task<DeletePromptResponse> DeletePrompt(DeletePromptRequest request, ServerCallContext context)
    {
        if (!Guid.TryParse(request.Id, out var promptId))
        {
            throw new RpcException(new Status(StatusCode.InvalidArgument, "Invalid prompt ID format"));
        }

        var entity = await _dbContext.ChatPrompts.FirstOrDefaultAsync(p => p.Id == promptId);

        if (entity == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Prompt not found"));
        }

        var type = entity.Type;
        _dbContext.ChatPrompts.Remove(entity);
        await _dbContext.SaveChangesAsync();

        // Invalidate cache for this type
        await _promptCacheService.InvalidateCacheAsync(type);

        _logger.LogInformation("Deleted prompt {Id}", promptId);

        return new DeletePromptResponse
        {
            Success = true
        };
    }

    public override async Task<PromptInfo> GetPrompt(GetPromptRequest request, ServerCallContext context)
    {
        if (!Guid.TryParse(request.Id, out var promptId))
        {
            throw new RpcException(new Status(StatusCode.InvalidArgument, "Invalid prompt ID format"));
        }

        var entity = await _dbContext.ChatPrompts
            .AsNoTracking()
            .FirstOrDefaultAsync(p => p.Id == promptId);

        if (entity == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Prompt not found"));
        }

        return MapToPromptInfo(entity);
    }

    public override async Task<ListPromptsResponse> ListPrompts(ListPromptsRequest request, ServerCallContext context)
    {
        var query = _dbContext.ChatPrompts.AsNoTracking();

        var totalCount = await query.CountAsync();

        var prompts = await query
            .OrderByDescending(p => p.UpdatedAt)
            .Skip(request.Offset)
            .Take(request.Limit > 0 ? request.Limit : 50)
            .ToListAsync();

        var response = new ListPromptsResponse { TotalCount = totalCount };

        foreach (var entity in prompts)
        {
            response.Prompts.Add(MapToPromptInfo(entity));
        }

        return response;
    }

    public override async Task<ListPromptsResponse> GetPromptsByType(GetPromptsByTypeRequest request, ServerCallContext context)
    {
        var query = _dbContext.ChatPrompts
            .AsNoTracking()
            .Where(p => p.Type == request.Type);

        var totalCount = await query.CountAsync();

        var prompts = await query
            .OrderByDescending(p => p.UpdatedAt)
            .Skip(request.Offset)
            .Take(request.Limit > 0 ? request.Limit : 50)
            .ToListAsync();

        var response = new ListPromptsResponse { TotalCount = totalCount };

        foreach (var entity in prompts)
        {
            response.Prompts.Add(MapToPromptInfo(entity));
        }

        return response;
    }

    private static PromptInfo MapToPromptInfo(ChatPromptEntity entity)
    {
        return new PromptInfo
        {
            Id = entity.Id.ToString(),
            Name = entity.Name,
            Type = entity.Type,
            Prompt = entity.Prompt,
            WelcomeMessage = entity.WelcomeMessage ?? string.Empty,
            CreatedAt = Timestamp.FromDateTime(entity.CreatedAt.ToUniversalTime()),
            UpdatedAt = Timestamp.FromDateTime(entity.UpdatedAt.ToUniversalTime())
        };
    }
}
