using System.IO;
using System.Text.Json;
using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using PharmaGo.Chat.Grpc.Protos;

namespace PharmaGo.Chat.Grpc.Services.RAG;

public class RagGrpcService : RAGService.RAGServiceBase
{
    private readonly IRagService _ragService;
    private readonly ILogger<RagGrpcService> _logger;

    public RagGrpcService(
        IRagService ragService,
        ILogger<RagGrpcService> logger)
    {
        _ragService = ragService;
        _logger = logger;
    }

    /// <summary>
    /// Upload multiple files with streaming progress notifications.
    /// Server streams back progress for each file as it's processed.
    /// </summary>
    public override async Task UploadFilesBatch(
        RagUploadFilesBatchRequest request,
        IServerStreamWriter<RagUploadFileProgress> responseStream,
        ServerCallContext context)
    {
        var totalFiles = request.Files.Count;
        _logger.LogInformation("Starting batch upload of {TotalFiles} files", totalFiles);

        for (var i = 0; i < request.Files.Count; i++)
        {
            var file = request.Files[i];
            var fileName = file.FileName;

            // Send RECEIVED status
            await responseStream.WriteAsync(new RagUploadFileProgress
            {
                FileName = fileName,
                FileIndex = i,
                TotalFiles = totalFiles,
                Status = RagUploadStatus.UploadStatusReceived,
                Message = $"File '{fileName}' received",
                Timestamp = Timestamp.FromDateTime(DateTime.UtcNow)
            });

            // Send PROCESSING status
            await responseStream.WriteAsync(new RagUploadFileProgress
            {
                FileName = fileName,
                FileIndex = i,
                TotalFiles = totalFiles,
                Status = RagUploadStatus.UploadStatusProcessing,
                Message = $"Processing '{fileName}'...",
                Timestamp = Timestamp.FromDateTime(DateTime.UtcNow)
            });

            try
            {
                // Auto-detect document type from extension if not specified
                var documentType = file.DocumentType;
                if (string.IsNullOrEmpty(documentType))
                {
                    documentType = DetectDocumentType(fileName);
                }

                // Extract title from filename (without extension)
                var title = Path.GetFileNameWithoutExtension(fileName);

                // Process the file
                var metadata = file.Metadata.Count > 0
                    ? file.Metadata.ToDictionary(kvp => kvp.Key, kvp => kvp.Value)
                    : null;
                var tags = file.Tags.Count > 0 ? file.Tags.ToArray() : null;

                var document = await _ragService.AddDocumentAsync(
                    title,
                    file.Content,
                    documentType,
                    string.IsNullOrEmpty(file.Type) ? null : file.Type,
                    metadata,
                    tags);

                // Send COMPLETED status
                await responseStream.WriteAsync(new RagUploadFileProgress
                {
                    FileName = fileName,
                    FileIndex = i,
                    TotalFiles = totalFiles,
                    Status = RagUploadStatus.UploadStatusCompleted,
                    Message = $"File '{fileName}' processed successfully",
                    DocumentId = document.Id,
                    Timestamp = Timestamp.FromDateTime(DateTime.UtcNow)
                });

                _logger.LogInformation("Processed file {Index}/{Total}: {FileName} -> Document {DocumentId}",
                    i + 1, totalFiles, fileName, document.Id);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to process file {FileName}", fileName);

                // Send FAILED status
                await responseStream.WriteAsync(new RagUploadFileProgress
                {
                    FileName = fileName,
                    FileIndex = i,
                    TotalFiles = totalFiles,
                    Status = RagUploadStatus.UploadStatusFailed,
                    Message = $"Failed to process '{fileName}'",
                    Error = ex.Message,
                    Timestamp = Timestamp.FromDateTime(DateTime.UtcNow)
                });
            }
        }

        _logger.LogInformation("Batch upload completed for {TotalFiles} files", totalFiles);
    }

    /// <summary>
    /// Detects document type from file extension.
    /// </summary>
    private static string DetectDocumentType(string fileName)
    {
        var extension = Path.GetExtension(fileName)?.ToLowerInvariant();
        return extension switch
        {
            ".md" => "markdown",
            ".txt" => "text",
            ".html" or ".htm" => "html",
            _ => "text"
        };
    }

    public override async Task<RagAddDocumentResponse> AddDocument(RagAddDocumentRequest request, ServerCallContext context)
    {
        var metadata = request.Metadata.ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
        var tags = request.Tags.ToArray();

        var document = await _ragService.AddDocumentAsync(
            request.Title,
            request.Content,
            request.DocumentType,
            string.IsNullOrEmpty(request.Type) ? null : request.Type,
            metadata.Count > 0 ? metadata : null,
            tags.Length > 0 ? tags : null);

        _logger.LogInformation("Added document {DocumentId}: {Title} with Type='{Type}'", document.Id, document.Title, request.Type);

        return new RagAddDocumentResponse
        {
            DocumentId = document.Id,
            CreatedAt = Timestamp.FromDateTime(document.CreatedAt.ToUniversalTime())
        };
    }

    public override async Task<RagAddDocumentsBatchResponse> AddDocumentsBatch(RagAddDocumentsBatchRequest request, ServerCallContext context)
    {
        var response = new RagAddDocumentsBatchResponse();
        int successCount = 0;
        int failureCount = 0;

        var documentsToAdd = new List<DocumentAddRequest>();

        foreach (var docRequest in request.Documents)
        {
            documentsToAdd.Add(new DocumentAddRequest
            {
                Title = docRequest.Title,
                Content = docRequest.Content,
                DocumentType = docRequest.DocumentType,
                Type = docRequest.Type,
                Metadata = docRequest.Metadata.Count > 0 ? docRequest.Metadata.ToDictionary(kvp => kvp.Key, kvp => kvp.Value) : null,
                Tags = docRequest.Tags.Count > 0 ? docRequest.Tags.ToArray() : null
            });
        }

        foreach (var docRequest in documentsToAdd)
        {
            try
            {
                var document = await _ragService.AddDocumentAsync(
                    docRequest.Title,
                    docRequest.Content,
                    docRequest.DocumentType,
                    string.IsNullOrEmpty(docRequest.Type) ? null : docRequest.Type,
                    docRequest.Metadata,
                    docRequest.Tags);

                response.Results.Add(new RagAddDocumentResponse
                {
                    DocumentId = document.Id,
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
        var success = await _ragService.DeleteDocumentAsync(request.DocumentId);

        if (!success)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Document not found"));
        }

        _logger.LogInformation("Deleted document {DocumentId}", request.DocumentId);

        return new RagDeleteDocumentResponse
        {
            Success = success
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
                var success = await _ragService.DeleteDocumentAsync(documentId);

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
            string.IsNullOrEmpty(request.DocumentTypeFilter) ? null : request.DocumentTypeFilter,
            string.IsNullOrEmpty(request.TypeFilter) ? null : request.TypeFilter,
            tagFilter);

        var response = new RagListDocumentsResponse { TotalCount = totalCount };

        foreach (var doc in documents)
        {
            var metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(doc.Metadata.AsSpan()) ?? new();
            var info = new RagDocumentInfo
            {
                DocumentId = doc.Id,
                Title = doc.Title,
                DocumentType = doc.DocumentType,
                Type = doc.Type,
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
        var document = await _ragService.GetDocumentAsync(request.DocumentId);

        if (document == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, "Document not found"));
        }

        var metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(document.Metadata.AsSpan()) ?? new();
        var info = new RagDocumentInfo
        {
            DocumentId = document.Id,
            Title = document.Title,
            DocumentType = document.DocumentType,
            Type = document.Type,
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

        // Default threshold is 0.3 (lowered from 0.7 for better semantic matching)
        var results = await _ragService.SearchAsync(
            request.Query,
            request.Limit > 0 ? request.Limit : 10,
            request.SimilarityThreshold > 0 ? request.SimilarityThreshold : 0.3f,
            string.IsNullOrEmpty(request.TypeFilter) ? null : request.TypeFilter,
            tagFilter);

        var response = new RagSearchDocumentsResponse();

        foreach (var result in results)
        {
            var searchResult = new RagSearchResult
            {
                DocumentId = result.DocumentId,
                Title = result.Title,
                Content = result.Content,
                Type = result.Type,
                SimilarityScore = result.SimilarityScore,
                Tags = { result.Tags }
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
