using Microsoft.EntityFrameworkCore;
using Pgvector;
using Pgvector.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Configurations;
using PharmaGo.Chat.Grpc.Data.Context;
using PharmaGo.Chat.Grpc.Models.Entities;
using PharmaGo.Chat.Grpc.Services.AI;
using System.Text.Json;
using System.Text.RegularExpressions;

namespace PharmaGo.Chat.Grpc.Services.RAG;

public class RagService : IRagService
{
    private readonly ChatDbContext _dbContext;
    private readonly IAIServiceFactory _aiServiceFactory;
    private readonly EmbeddingSettings _settings;
    private readonly ILogger<RagService> _logger;

    public RagService(
        ChatDbContext dbContext,
        IAIServiceFactory aiServiceFactory,
        ChatSettings settings,
        ILogger<RagService> logger)
    {
        _dbContext = dbContext;
        _aiServiceFactory = aiServiceFactory;
        _settings = settings.Embedding;
        _logger = logger;
    }

    /// <summary>
    /// Splits text into chunks with overlap, respecting sentence boundaries when possible.
    /// </summary>
    private List<TextChunk> SplitTextIntoChunks(string content, int maxChunkSize, int overlap)
    {
        var chunks = new List<TextChunk>();

        if (string.IsNullOrEmpty(content) || content.Length <= maxChunkSize)
        {
            chunks.Add(new TextChunk
            {
                Content = content,
                Index = 0,
                StartChar = 0,
                EndChar = content.Length
            });
            return chunks;
        }

        // Split by sentences first (Portuguese and English sentence endings)
        var sentencePattern = @"(?<=[.!?。！？])\s+";
        var sentences = Regex.Split(content, sentencePattern);

        var currentChunk = new System.Text.StringBuilder();
        var currentStartChar = 0;
        var chunkIndex = 0;
        var charPosition = 0;

        foreach (var sentence in sentences)
        {
            // If adding this sentence would exceed max size
            if (currentChunk.Length + sentence.Length > maxChunkSize && currentChunk.Length > 0)
            {
                // Save current chunk
                var chunkContent = currentChunk.ToString().Trim();
                if (!string.IsNullOrEmpty(chunkContent))
                {
                    chunks.Add(new TextChunk
                    {
                        Content = chunkContent,
                        Index = chunkIndex++,
                        StartChar = currentStartChar,
                        EndChar = charPosition
                    });
                }

                // Calculate overlap - take last N characters for context
                var overlapText = "";
                if (overlap > 0 && currentChunk.Length > overlap)
                {
                    overlapText = currentChunk.ToString().Substring(currentChunk.Length - overlap);
                    // Try to start at a word boundary
                    var spaceIndex = overlapText.IndexOf(' ');
                    if (spaceIndex > 0)
                    {
                        overlapText = overlapText.Substring(spaceIndex + 1);
                    }
                }

                currentChunk.Clear();
                currentChunk.Append(overlapText);
                currentStartChar = charPosition - overlapText.Length;
            }

            currentChunk.Append(sentence);
            charPosition += sentence.Length;

            // If sentence alone exceeds max, force split it
            if (sentence.Length > maxChunkSize)
            {
                var remainingText = currentChunk.ToString();
                currentChunk.Clear();

                while (remainingText.Length > maxChunkSize)
                {
                    var splitPoint = maxChunkSize;
                    // Try to split at word boundary
                    var lastSpace = remainingText.LastIndexOf(' ', splitPoint);
                    if (lastSpace > maxChunkSize / 2)
                    {
                        splitPoint = lastSpace;
                    }

                    var chunkText = remainingText.Substring(0, splitPoint).Trim();
                    chunks.Add(new TextChunk
                    {
                        Content = chunkText,
                        Index = chunkIndex++,
                        StartChar = currentStartChar,
                        EndChar = currentStartChar + splitPoint
                    });

                    // Apply overlap
                    var overlapStart = Math.Max(0, splitPoint - overlap);
                    remainingText = remainingText.Substring(overlapStart);
                    currentStartChar += overlapStart;
                }

                currentChunk.Append(remainingText);
            }
        }

        // Add final chunk if any content remains
        if (currentChunk.Length > 0)
        {
            var finalContent = currentChunk.ToString().Trim();
            if (!string.IsNullOrEmpty(finalContent))
            {
                chunks.Add(new TextChunk
                {
                    Content = finalContent,
                    Index = chunkIndex,
                    StartChar = currentStartChar,
                    EndChar = content.Length
                });
            }
        }

        return chunks;
    }

    public async Task<DocumentsTable> AddDocumentAsync(
        string title,
        string content,
        string documentType,
        Dictionary<string, string>? metadata = null,
        string[]? tags = null)
    {
        var embeddingService = _aiServiceFactory.GetEmbeddingService();
        var metadataJson = metadata != null ? JsonSerializer.Serialize(metadata) : "{}";
        var documentTags = tags ?? Array.Empty<string>();

        // Split content into chunks
        var chunks = SplitTextIntoChunks(content, _settings.MaxChunkSize, _settings.ChunkOverlap);

        _logger.LogInformation("Document '{Title}' ({Length} chars) split into {ChunkCount} chunks",
            title, content.Length, chunks.Count);

        // If only one chunk (small document), store as single document without parent reference
        if (chunks.Count == 1)
        {
            var embedding = await embeddingService.GenerateEmbeddingAsync(content);

            var document = new DocumentsTable
            {
                Title = title,
                Content = content,
                DocumentType = documentType,
                ContentLength = content.Length,
                Metadata = metadataJson,
                Tags = documentTags,
                Embedding = new Vector(embedding),
                ParentDocumentId = null,
                ChunkIndex = null,
                StartChar = null,
                EndChar = null,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            _dbContext.DocumentsTable.Add(document);
            await _dbContext.SaveChangesAsync();

            _logger.LogInformation("Added single document {DocumentId}: {Title} with embedding", document.Id, title);
            return document;
        }

        // For multi-chunk documents: first create parent document without embedding
        var parentDocument = new DocumentsTable
        {
            Title = title,
            Content = content, // Store full content in parent
            DocumentType = documentType,
            ContentLength = content.Length,
            Metadata = metadataJson,
            Tags = documentTags,
            Embedding = null, // Parent doesn't have embedding - search is done on chunks
            ParentDocumentId = null,
            ChunkIndex = null,
            StartChar = null,
            EndChar = null,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        _dbContext.DocumentsTable.Add(parentDocument);
        await _dbContext.SaveChangesAsync();

        _logger.LogInformation("Created parent document {DocumentId}: {Title}", parentDocument.Id, title);

        // Create chunks with embeddings
        foreach (var chunk in chunks)
        {
            var chunkEmbedding = await embeddingService.GenerateEmbeddingAsync(chunk.Content);

            var chunkDocument = new DocumentsTable
            {
                Title = $"{title} [Chunk {chunk.Index + 1}/{chunks.Count}]",
                Content = chunk.Content,
                DocumentType = documentType,
                ContentLength = chunk.Content.Length,
                Metadata = metadataJson,
                Tags = documentTags,
                Embedding = new Vector(chunkEmbedding),
                ParentDocumentId = parentDocument.Id,
                ChunkIndex = chunk.Index,
                StartChar = chunk.StartChar,
                EndChar = chunk.EndChar,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            _dbContext.DocumentsTable.Add(chunkDocument);
        }

        await _dbContext.SaveChangesAsync();

        _logger.LogInformation("Added {ChunkCount} chunks for document {DocumentId}: {Title}",
            chunks.Count, parentDocument.Id, title);

        return parentDocument;
    }

    public async Task<List<DocumentsTable>> AddDocumentsBatchAsync(List<DocumentAddRequest> documents)
    {
        var addedDocuments = new List<DocumentsTable>();

        foreach (var docRequest in documents)
        {
            try
            {
                // Use AddDocumentAsync which handles chunking
                var document = await AddDocumentAsync(
                    docRequest.Title,
                    docRequest.Content,
                    docRequest.DocumentType,
                    docRequest.Metadata,
                    docRequest.Tags);

                addedDocuments.Add(document);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to add document: {Title}", docRequest.Title);
                throw;
            }
        }

        _logger.LogInformation("Added {Count} documents in batch with chunking", addedDocuments.Count);

        return addedDocuments;
    }

    public async Task<bool> DeleteDocumentAsync(long documentId)
    {
        var document = await _dbContext.DocumentsTable.FindAsync(documentId);

        if (document == null)
        {
            return false;
        }

        // If this is a parent document, delete all its chunks first
        if (document.ParentDocumentId == null)
        {
            var chunks = await _dbContext.DocumentsTable
                .Where(d => d.ParentDocumentId == documentId)
                .ToListAsync();

            if (chunks.Count > 0)
            {
                _dbContext.DocumentsTable.RemoveRange(chunks);
                _logger.LogInformation("Deleted {ChunkCount} chunks for document {DocumentId}", chunks.Count, documentId);
            }
        }

        _dbContext.DocumentsTable.Remove(document);
        await _dbContext.SaveChangesAsync();

        _logger.LogInformation("Deleted document {DocumentId}: {Title}", documentId, document.Title);

        return true;
    }

    public async Task<bool> DeleteDocumentsBatchAsync(List<long> documentIds)
    {
        var documents = await _dbContext.DocumentsTable
            .Where(d => documentIds.Contains(d.Id))
            .ToListAsync();

        if (documents.Count == 0)
        {
            return false;
        }

        // Find all chunks that belong to parent documents being deleted
        var parentIds = documents
            .Where(d => d.ParentDocumentId == null)
            .Select(d => d.Id)
            .ToList();

        if (parentIds.Count > 0)
        {
            var chunks = await _dbContext.DocumentsTable
                .Where(d => d.ParentDocumentId != null && parentIds.Contains(d.ParentDocumentId.Value))
                .ToListAsync();

            if (chunks.Count > 0)
            {
                _dbContext.DocumentsTable.RemoveRange(chunks);
                _logger.LogInformation("Deleted {ChunkCount} chunks for batch deletion", chunks.Count);
            }
        }

        _dbContext.DocumentsTable.RemoveRange(documents);
        await _dbContext.SaveChangesAsync();

        _logger.LogInformation("Deleted {Count} documents in batch", documents.Count);

        return true;
    }

    public async Task<DocumentsTable?> GetDocumentAsync(long documentId)
    {
        return await _dbContext.DocumentsTable
            .AsNoTracking()
            .FirstOrDefaultAsync(d => d.Id == documentId);
    }

    public async Task<(List<DocumentsTable> Documents, int TotalCount)> ListDocumentsAsync(
        int limit = 20,
        int offset = 0,
        string? typeFilter = null,
        string[]? tagFilter = null)
    {
        // Only list parent documents (not chunks)
        var query = _dbContext.DocumentsTable.AsNoTracking()
            .Where(d => d.ParentDocumentId == null);

        if (!string.IsNullOrEmpty(typeFilter))
        {
            query = query.Where(d => d.DocumentType == typeFilter);
        }

        if (tagFilter != null && tagFilter.Length > 0)
        {
            query = query.Where(d => d.Tags.Any(t => tagFilter.Contains(t)));
        }

        var totalCount = await query.CountAsync();

        var documents = await query
            .OrderByDescending(d => d.CreatedAt)
            .Skip(offset)
            .Take(limit)
            .ToListAsync();

        return (documents, totalCount);
    }

    public async Task<List<SearchResult>> SearchAsync(
        string query,
        int limit = 5,
        float similarityThreshold = 0.3f,
        string[]? tagFilter = null)
    {
        var embeddingService = _aiServiceFactory.GetEmbeddingService();
        var queryEmbedding = await embeddingService.GenerateEmbeddingAsync(query);
        var queryVector = new Vector(queryEmbedding);

        _logger.LogInformation("RAG Search: Query='{Query}', Threshold={Threshold}, EmbeddingDimensions={Dims}",
            query, similarityThreshold, queryEmbedding.Length);

        // Only search documents that have embeddings (chunks or small documents)
        var documentsQuery = _dbContext.DocumentsTable.AsNoTracking()
            .Where(d => d.Embedding != null);

        if (tagFilter != null && tagFilter.Length > 0)
        {
            documentsQuery = documentsQuery.Where(d => d.Tags.Any(t => tagFilter.Contains(t)));
        }

        // Count documents with embeddings for debugging
        var totalDocsWithEmbedding = await documentsQuery.CountAsync();
        _logger.LogInformation("RAG Search: Found {Count} documents with embeddings in database", totalDocsWithEmbedding);

        if (totalDocsWithEmbedding == 0)
        {
            _logger.LogWarning("RAG Search: No documents with embeddings found in database!");
            return new List<SearchResult>();
        }

        // pgVector's CosineDistance returns values from 0 to 2:
        // - 0 = identical vectors
        // - 1 = orthogonal vectors (no relationship)
        // - 2 = opposite vectors
        //
        // Convert distance to similarity: similarity = 1 - (distance / 2)
        // This gives a range of 0 to 1 where 1 = identical
        //
        // For threshold filtering, we use distance directly:
        // - threshold 0.3 similarity means distance <= 1.4 (1 - 0.3*2 = 0.4, so dist = 2*(1-0.3) = 1.4)
        // Actually simpler: if similarity = 1 - dist/2, then dist = 2*(1-similarity)
        // So threshold 0.3 means max distance = 2*(1-0.3) = 1.4
        var maxDistance = 2.0 * (1.0 - similarityThreshold);

        _logger.LogInformation("RAG Search: Using maxDistance={MaxDist} for threshold={Threshold}",
            maxDistance, similarityThreshold);

        // Get results ordered by distance (lower = more similar)
        var allResults = await documentsQuery
            .Select(d => new
            {
                Document = d,
                Distance = d.Embedding!.CosineDistance(queryVector)
            })
            .OrderBy(x => x.Distance)
            .Take(limit * 2) // Get more than needed to see what's available
            .ToListAsync();

        // Log results with correct similarity calculation
        _logger.LogInformation("RAG Search: Top {Count} results by distance: {Results}",
            allResults.Count,
            string.Join(", ", allResults.Select(r =>
                $"[{r.Document.Title}: dist={r.Distance:F4}, sim={1.0 - r.Distance / 2.0:F4}]")));

        // Filter by threshold using correct distance calculation
        var filteredResults = allResults
            .Where(x => x.Distance <= maxDistance)
            .Take(limit)
            .ToList();

        _logger.LogInformation("RAG Search: After threshold filter (maxDist={MaxDist}): {Count} results",
            maxDistance, filteredResults.Count);

        return filteredResults.Select(r => new SearchResult
        {
            DocumentId = r.Document.Id,
            ParentDocumentId = r.Document.ParentDocumentId,
            ChunkIndex = r.Document.ChunkIndex,
            Title = r.Document.Title,
            Content = r.Document.Content,
            // Correct similarity: 1 - (distance/2) gives 0-1 range
            SimilarityScore = (float)(1.0 - r.Distance / 2.0),
            Metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(r.Document.Metadata.AsSpan()) ?? new(),
            Tags = r.Document.Tags
        }).ToList();
    }

    public async Task<string> BuildContextAsync(string query, int maxTokens = 2000)
    {
        _logger.LogInformation("BuildContextAsync: Building context for query '{Query}' with maxTokens={MaxTokens}",
            query, maxTokens);

        var searchResults = await SearchAsync(
            query,
            limit: _settings.DefaultTopK,
            similarityThreshold: _settings.DefaultSimilarityThreshold);

        if (searchResults.Count == 0)
        {
            _logger.LogWarning("BuildContextAsync: No search results found for query '{Query}'", query);
            return string.Empty;
        }

        _logger.LogInformation("BuildContextAsync: Found {Count} search results", searchResults.Count);

        var context = new List<string>();
        int currentTokens = 0;

        foreach (var result in searchResults)
        {
            var contentTokens = EstimateTokenCount(result.Content);
            if (currentTokens + contentTokens > maxTokens)
            {
                break;
            }

            // Extract base title (remove chunk suffix if present)
            var baseTitle = result.Title;
            if (result.ChunkIndex.HasValue)
            {
                var bracketIndex = baseTitle.LastIndexOf(" [Chunk");
                if (bracketIndex > 0)
                {
                    baseTitle = baseTitle.Substring(0, bracketIndex);
                }
            }

            context.Add($"[Fonte: {baseTitle}]\n{result.Content}");
            currentTokens += contentTokens;
        }

        return string.Join("\n\n---\n\n", context);
    }

    private static int EstimateTokenCount(string text)
    {
        // Rough estimation: 1 token ≈ 4 characters
        return text.Length / 4;
    }
}
