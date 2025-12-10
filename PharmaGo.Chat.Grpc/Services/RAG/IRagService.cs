using PharmaGo.Chat.Grpc.Models.Entities;

namespace PharmaGo.Chat.Grpc.Services.RAG;

public interface IRagService
{
    // Document management
    Task<RagDocument> AddDocumentAsync(string title, string content, string documentType, Dictionary<string, string>? metadata = null, string[]? tags = null);
    Task<bool> DeleteDocumentAsync(Guid documentId);
    Task<RagDocument?> GetDocumentAsync(Guid documentId);
    Task<(List<RagDocument> Documents, int TotalCount)> ListDocumentsAsync(int limit = 20, int offset = 0, string? typeFilter = null, string[]? tagFilter = null);

    // Semantic search
    Task<List<SearchResult>> SearchAsync(string query, int limit = 5, float similarityThreshold = 0.7f, string[]? tagFilter = null);

    // Context building for RAG
    Task<string> BuildContextAsync(string query, int maxTokens = 2000);
}

public class SearchResult
{
    public Guid DocumentId { get; set; }
    public Guid ChunkId { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Content { get; set; } = string.Empty;
    public float SimilarityScore { get; set; }
    public Dictionary<string, string> Metadata { get; set; } = new();
}
