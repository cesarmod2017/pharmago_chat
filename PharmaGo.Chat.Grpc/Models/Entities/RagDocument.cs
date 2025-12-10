using Pgvector;

namespace PharmaGo.Chat.Grpc.Models.Entities;

public class RagDocument
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string Title { get; set; } = string.Empty;
    public string DocumentType { get; set; } = "text"; // text, markdown, pdf_text, html
    public string Content { get; set; } = string.Empty;
    public int ContentLength { get; set; } = 0;
    public int ChunkCount { get; set; } = 0;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    public string Metadata { get; set; } = "{}";
    public string[] Tags { get; set; } = Array.Empty<string>();

    // Navigation
    public virtual ICollection<RagChunk> Chunks { get; set; } = new List<RagChunk>();
}

public class RagChunk
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid DocumentId { get; set; }
    public int ChunkIndex { get; set; }
    public string Content { get; set; } = string.Empty;
    public Vector? Embedding { get; set; }
    public int TokenCount { get; set; } = 0;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation
    public virtual RagDocument Document { get; set; } = null!;
}
