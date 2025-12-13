using PharmaGo.Chat.Grpc.Models.Entities;

namespace PharmaGo.Chat.Grpc.Services.RAG;

public interface IRagService
{
    // Document management (using DocumentEntity with embeddings)
    Task<DocumentEntity> AddDocumentAsync(string title, string content, string documentType, string? type = null, Dictionary<string, string>? metadata = null, string[]? tags = null);
    Task<List<DocumentEntity>> AddDocumentsBatchAsync(List<DocumentAddRequest> documents);
    Task<bool> DeleteDocumentAsync(long documentId);
    Task<bool> DeleteDocumentsBatchAsync(List<long> documentIds);
    Task<DocumentEntity?> GetDocumentAsync(long documentId);
    Task<(List<DocumentEntity> Documents, int TotalCount)> ListDocumentsAsync(int limit = 20, int offset = 0, string? documentTypeFilter = null, string? typeFilter = null, string[]? tagFilter = null);

    // Semantic search (on DocumentEntity with embeddings)
    Task<List<SearchResult>> SearchAsync(string query, int limit = 5, float similarityThreshold = 0.3f, string? typeFilter = null, string[]? tagFilter = null);

    // Context building for RAG
    Task<string> BuildContextAsync(string query, string? typeFilter = null, int maxTokens = 2000);
}

/// <summary>
/// Request object for batch document addition
/// </summary>
public class DocumentAddRequest
{
    public string Title { get; set; } = string.Empty;
    public string Content { get; set; } = string.Empty;
    public string DocumentType { get; set; } = "text";
    public string Type { get; set; } = string.Empty;
    public Dictionary<string, string>? Metadata { get; set; }
    public string[]? Tags { get; set; }
}

/// <summary>
/// Search result from DocumentEntity
/// </summary>
public class SearchResult
{
    public long DocumentId { get; set; }
    public long? ParentDocumentId { get; set; }
    public int? ChunkIndex { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Content { get; set; } = string.Empty;
    public string Type { get; set; } = string.Empty;
    public float SimilarityScore { get; set; }
    public Dictionary<string, string> Metadata { get; set; } = new();
    public string[] Tags { get; set; } = Array.Empty<string>();
}

/// <summary>
/// Represents a text chunk with position information
/// </summary>
public class TextChunk
{
    public string Content { get; set; } = string.Empty;
    public int Index { get; set; }
    public int StartChar { get; set; }
    public int EndChar { get; set; }
}
