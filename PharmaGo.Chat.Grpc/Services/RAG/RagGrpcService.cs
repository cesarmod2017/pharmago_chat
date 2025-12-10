using System.Text.Json;
using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Data.Context;
using PharmaGo.Chat.Grpc.Protos;

namespace PharmaGo.Chat.Grpc.Services.RAG;

public class RagGrpcService : RAGService.RAGServiceBase
{
    private readonly IRagService _ragService;
    private readonly ChatDbContext _dbContext;
    private readonly ILogger<RagGrpcService> _logger;

    public RagGrpcService(
        IRagService ragService,
        ChatDbContext dbContext,
        ILogger<RagGrpcService> logger)
    {
        _ragService = ragService;
        _dbContext = dbContext;
        _logger = logger;
    }

    public override async Task<RagAddDocumentResponse> AddDocument(RagAddDocumentRequest request, ServerCallContext context)
    {
        var metadata = request.Metadata.ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
        var tags = request.Tags.ToArray();

        var document = await _ragService.AddDocumentAsync(
            request.Title,
            request.Content,
            request.DocumentType,
            metadata,
            tags);

        _logger.LogInformation("Added document {DocumentId}: {Title}", document.Id, document.Title);

        return new RagAddDocumentResponse
        {
            DocumentId = document.Id.ToString(),
            ChunksCreated = document.ChunkCount,
            CreatedAt = Timestamp.FromDateTime(document.CreatedAt.ToUniversalTime())
        };
    }

    public override async Task<RagAddDocumentsBatchResponse> AddDocumentsBatch(RagAddDocumentsBatchRequest request, ServerCallContext context)
    {
        var response = new RagAddDocumentsBatchResponse();
        int successCount = 0;
        int failureCount = 0;

        foreach (var docRequest in request.Documents)
        {
            try
            {
                var metadata = docRequest.Metadata.ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
                var tags = docRequest.Tags.ToArray();

                var document = await _ragService.AddDocumentAsync(
                    docRequest.Title,
                    docRequest.Content,
                    docRequest.DocumentType,
                    metadata,
                    tags);

                response.Results.Add(new RagAddDocumentResponse
                {
                    DocumentId = document.Id.ToString(),
                    ChunksCreated = document.ChunkCount,
                    CreatedAt = Timestamp.FromDateTime(document.CreatedAt.ToUniversalTime())
                });

                successCount++;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to add document: {Title}", docRequest.Title);
                response.Errors.Add($"Failed to add '{docRequest.Title}': {ex.Message}");
                failureCount++;
            }
        }

        response.SuccessCount = successCount;
        response.FailureCount = failureCount;

        return response;
    }

    public override async Task<RagDeleteDocumentResponse> DeleteDocument(RagDeleteDocumentRequest request, ServerCallContext context)
    {
        var documentId = Guid.Parse(request.DocumentId);
        var document = await _dbContext.Documents
            .Include(d => d.Chunks)
            .FirstOrDefaultAsync(d => d.Id == documentId);

        if (document == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Document not found"));
        }

        var chunkCount = document.ChunkCount;
        var success = await _ragService.DeleteDocumentAsync(documentId);

        _logger.LogInformation("Deleted document {DocumentId}", request.DocumentId);

        return new RagDeleteDocumentResponse
        {
            Success = success,
            ChunksDeleted = chunkCount
        };
    }

    public override async Task<RagDeleteDocumentsBatchResponse> DeleteDocumentsBatch(RagDeleteDocumentsBatchRequest request, ServerCallContext context)
    {
        int successCount = 0;
        int failureCount = 0;
        var errors = new List<string>();

        foreach (var documentId in request.DocumentIds)
        {
            try
            {
                var guid = Guid.Parse(documentId);
                var success = await _ragService.DeleteDocumentAsync(guid);

                if (success)
                {
                    successCount++;
                }
                else
                {
                    failureCount++;
                    errors.Add($"Document {documentId} not found");
                }
            }
            catch (Exception ex)
            {
                failureCount++;
                errors.Add($"Failed to delete {documentId}: {ex.Message}");
            }
        }

        return new RagDeleteDocumentsBatchResponse
        {
            SuccessCount = successCount,
            FailureCount = failureCount,
            Errors = { errors }
        };
    }

    public override async Task<RagListDocumentsResponse> ListDocuments(RagListDocumentsRequest request, ServerCallContext context)
    {
        var tagFilter = request.TagFilter.Count > 0 ? request.TagFilter.ToArray() : null;

        var (documents, totalCount) = await _ragService.ListDocumentsAsync(
            request.Limit > 0 ? request.Limit : 20,
            request.Offset,
            string.IsNullOrEmpty(request.TypeFilter) ? null : request.TypeFilter,
            tagFilter);

        var response = new RagListDocumentsResponse { TotalCount = totalCount };

        foreach (var doc in documents)
        {
            var metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(doc.Metadata.AsSpan()) ?? new();
            var info = new RagDocumentInfo
            {
                DocumentId = doc.Id.ToString(),
                Title = doc.Title,
                DocumentType = doc.DocumentType,
                ChunkCount = doc.ChunkCount,
                CreatedAt = Timestamp.FromDateTime(doc.CreatedAt.ToUniversalTime()),
                UpdatedAt = Timestamp.FromDateTime(doc.UpdatedAt.ToUniversalTime()),
                ContentLength = doc.ContentLength,
                Tags = { doc.Tags }
            };

            foreach (var kvp in metadata)
            {
                info.Metadata.Add(kvp.Key, kvp.Value);
            }

            response.Documents.Add(info);
        }

        return response;
    }

    public override async Task<RagDocumentInfo> GetDocument(RagGetDocumentRequest request, ServerCallContext context)
    {
        var documentId = Guid.Parse(request.DocumentId);
        var document = await _ragService.GetDocumentAsync(documentId);

        if (document == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Document not found"));
        }

        var metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(document.Metadata.AsSpan()) ?? new();
        var info = new RagDocumentInfo
        {
            DocumentId = document.Id.ToString(),
            Title = document.Title,
            DocumentType = document.DocumentType,
            ChunkCount = document.ChunkCount,
            CreatedAt = Timestamp.FromDateTime(document.CreatedAt.ToUniversalTime()),
            UpdatedAt = Timestamp.FromDateTime(document.UpdatedAt.ToUniversalTime()),
            ContentLength = document.ContentLength,
            Tags = { document.Tags }
        };

        foreach (var kvp in metadata)
        {
            info.Metadata.Add(kvp.Key, kvp.Value);
        }

        return info;
    }

    public override async Task<RagSearchDocumentsResponse> SearchDocuments(RagSearchDocumentsRequest request, ServerCallContext context)
    {
        var tagFilter = request.TagFilter.Count > 0 ? request.TagFilter.ToArray() : null;

        var results = await _ragService.SearchAsync(
            request.Query,
            request.Limit > 0 ? request.Limit : 10,
            request.SimilarityThreshold > 0 ? request.SimilarityThreshold : 0.7f,
            tagFilter);

        var response = new RagSearchDocumentsResponse();

        foreach (var result in results)
        {
            var searchResult = new RagSearchResult
            {
                DocumentId = result.DocumentId.ToString(),
                ChunkId = result.ChunkId.ToString(),
                Title = result.Title,
                Content = result.Content,
                SimilarityScore = result.SimilarityScore
            };

            foreach (var kvp in result.Metadata)
            {
                searchResult.Metadata.Add(kvp.Key, kvp.Value);
            }

            response.Results.Add(searchResult);
        }

        return response;
    }
}
