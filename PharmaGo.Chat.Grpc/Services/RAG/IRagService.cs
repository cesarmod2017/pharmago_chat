using PharmaGo.Chat.Grpc.Models.Entities;

namespace PharmaGo.Chat.Grpc.Services.RAG;

public interface IRagService
{
    // Document management (using DocumentsTable with embeddings)
    Task<DocumentsTable> AddDocumentAsync(string title, string content, string documentType, Dictionary<string, string>? metadata = null, string[]? tags = null);
    Task<List<DocumentsTable>> AddDocumentsBatchAsync(List<DocumentAddRequest> documents);
    Task<bool> DeleteDocumentAsync(long documentId);
    Task<bool> DeleteDocumentsBatchAsync(List<long> documentIds);
    Task<DocumentsTable?> GetDocumentAsync(long documentId);
    Task<(List<DocumentsTable> Documents, int TotalCount)> ListDocumentsAsync(int limit = 20, int offset = 0, string? typeFilter = null, string[]? tagFilter = null);

    // Semantic search (on DocumentsTable with embeddings)
    Task<List<SearchResult>> SearchAsync(string query, int limit = 5, float similarityThreshold = 0.3f, string[]? tagFilter = null);

    // Context building for RAG
    Task<string> BuildContextAsync(string query, int maxTokens = 2000);
}

/// <summary>
/// Request object for batch document addition
/// </summary>
public class DocumentAddRequest
{
    public string Title { get; set; } = string.Empty;
    public string Content { get; set; } = string.Empty;
    public string DocumentType { get; set; } = "text";
    public Dictionary<string, string>? Metadata { get; set; }
    public string[]? Tags { get; set; }
}

/// <summary>
/// Search result from DocumentsTable
/// </summary>
public class SearchResult
{
    public long DocumentId { get; set; }
    public long? ParentDocumentId { get; set; }
    public int? ChunkIndex { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Content { get; set; } = string.Empty;
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
