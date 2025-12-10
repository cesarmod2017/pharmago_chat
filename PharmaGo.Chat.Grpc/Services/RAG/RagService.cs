using Microsoft.EntityFrameworkCore;
using Pgvector;
using Pgvector.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Configurations;
using PharmaGo.Chat.Grpc.Data.Context;
using PharmaGo.Chat.Grpc.Models.Entities;
using PharmaGo.Chat.Grpc.Services.AI;
using System.Text.Json;

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

    public async Task<RagDocument> AddDocumentAsync(
        string title,
        string content,
        string documentType,
        Dictionary<string, string>? metadata = null,
        string[]? tags = null)
    {
        var document = new RagDocument
        {
            Title = title,
            Content = content,
            DocumentType = documentType,
            ContentLength = content.Length,
            Metadata = metadata != null ? JsonSerializer.Serialize(metadata) : "{}",
            Tags = tags ?? Array.Empty<string>()
        };

        _dbContext.Documents.Add(document);

        // Chunk the content
        var chunks = ChunkText(content);
        var embeddingService = _aiServiceFactory.GetEmbeddingService();

        foreach (var (chunkContent, index) in chunks.Select((c, i) => (c, i)))
        {
            var embedding = await embeddingService.GenerateEmbeddingAsync(chunkContent);

            var chunk = new RagChunk
            {
                DocumentId = document.Id,
                ChunkIndex = index,
                Content = chunkContent,
                Embedding = new Vector(embedding),
                TokenCount = EstimateTokenCount(chunkContent)
            };

            document.Chunks.Add(chunk);
        }

        document.ChunkCount = chunks.Count;

        await _dbContext.SaveChangesAsync();

        _logger.LogInformation("Added document {DocumentId} with {ChunkCount} chunks", document.Id, document.ChunkCount);

        return document;
    }

    public async Task<bool> DeleteDocumentAsync(Guid documentId)
    {
        var document = await _dbContext.Documents
            .Include(d => d.Chunks)
            .FirstOrDefaultAsync(d => d.Id == documentId);

        if (document == null)
        {
            return false;
        }

        _dbContext.Documents.Remove(document);
        await _dbContext.SaveChangesAsync();

        _logger.LogInformation("Deleted document {DocumentId} with {ChunkCount} chunks", documentId, document.ChunkCount);

        return true;
    }

    public async Task<RagDocument?> GetDocumentAsync(Guid documentId)
    {
        return await _dbContext.Documents
            .AsNoTracking()
            .FirstOrDefaultAsync(d => d.Id == documentId);
    }

    public async Task<(List<RagDocument> Documents, int TotalCount)> ListDocumentsAsync(
        int limit = 20,
        int offset = 0,
        string? typeFilter = null,
        string[]? tagFilter = null)
    {
        var query = _dbContext.Documents.AsNoTracking();

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
        float similarityThreshold = 0.7f,
        string[]? tagFilter = null)
    {
        var embeddingService = _aiServiceFactory.GetEmbeddingService();
        var queryEmbedding = await embeddingService.GenerateEmbeddingAsync(query);
        var queryVector = new Vector(queryEmbedding);

        var chunksQuery = _dbContext.Chunks
            .Include(c => c.Document)
            .AsNoTracking();

        if (tagFilter != null && tagFilter.Length > 0)
        {
            chunksQuery = chunksQuery.Where(c => c.Document.Tags.Any(t => tagFilter.Contains(t)));
        }

        // Use pgVector's cosine distance
        var results = await chunksQuery
            .Select(c => new
            {
                Chunk = c,
                Distance = c.Embedding!.CosineDistance(queryVector)
            })
            .Where(x => (1 - x.Distance) >= similarityThreshold)
            .OrderBy(x => x.Distance)
            .Take(limit)
            .ToListAsync();

        return results.Select(r => new SearchResult
        {
            DocumentId = r.Chunk.DocumentId,
            ChunkId = r.Chunk.Id,
            Title = r.Chunk.Document.Title,
            Content = r.Chunk.Content,
            SimilarityScore = 1 - (float)r.Distance,
            Metadata = JsonSerializer.Deserialize<Dictionary<string, string>>(r.Chunk.Document.Metadata.AsSpan()) ?? new()
        }).ToList();
    }

    public async Task<string> BuildContextAsync(string query, int maxTokens = 2000)
    {
        var searchResults = await SearchAsync(
            query,
            limit: _settings.DefaultTopK,
            similarityThreshold: _settings.DefaultSimilarityThreshold);

        if (searchResults.Count == 0)
        {
            return string.Empty;
        }

        var context = new List<string>();
        int currentTokens = 0;

        foreach (var result in searchResults)
        {
            var chunkTokens = EstimateTokenCount(result.Content);
            if (currentTokens + chunkTokens > maxTokens)
            {
                break;
            }

            context.Add($"[Fonte: {result.Title}]\n{result.Content}");
            currentTokens += chunkTokens;
        }

        return string.Join("\n\n---\n\n", context);
    }

    private List<string> ChunkText(string text)
    {
        var chunks = new List<string>();
        var words = text.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        var currentChunk = new List<string>();
        int currentLength = 0;

        foreach (var word in words)
        {
            if (currentLength + word.Length + 1 > _settings.MaxChunkSize && currentChunk.Count > 0)
            {
                chunks.Add(string.Join(" ", currentChunk));

                // Keep overlap
                var overlapWords = currentChunk
                    .Skip(Math.Max(0, currentChunk.Count - _settings.ChunkOverlap / 5))
                    .ToList();

                currentChunk = new List<string>(overlapWords);
                currentLength = string.Join(" ", currentChunk).Length;
            }

            currentChunk.Add(word);
            currentLength += word.Length + 1;
        }

        if (currentChunk.Count > 0)
        {
            chunks.Add(string.Join(" ", currentChunk));
        }

        return chunks;
    }

    private static int EstimateTokenCount(string text)
    {
        // Rough estimation: 1 token ≈ 4 characters
        return text.Length / 4;
    }
}
