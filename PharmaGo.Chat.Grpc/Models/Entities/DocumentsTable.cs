using Pgvector;

namespace PharmaGo.Chat.Grpc.Models.Entities;

/// <summary>
/// Entity for documents table following Supabase/LangChain pattern.
/// Stores documents with their embeddings for vector similarity search.
/// Supports chunking: parent documents have ParentDocumentId = null,
/// chunks have ParentDocumentId pointing to the parent.
/// </summary>
public class DocumentsTable
{
    /// <summary>
    /// Primary key - auto-incrementing bigint
    /// </summary>
    public long Id { get; set; }

    /// <summary>
    /// Reference to parent document ID (null for parent documents, set for chunks)
    /// </summary>
    public long? ParentDocumentId { get; set; }

    /// <summary>
    /// Index of the chunk within the parent document (0-based, null for parent documents)
    /// </summary>
    public int? ChunkIndex { get; set; }

    /// <summary>
    /// Start character position of chunk in original document (null for parent documents)
    /// </summary>
    public int? StartChar { get; set; }

    /// <summary>
    /// End character position of chunk in original document (null for parent documents)
    /// </summary>
    public int? EndChar { get; set; }

    /// <summary>
    /// Document title for identification
    /// </summary>
    public string Title { get; set; } = string.Empty;

    /// <summary>
    /// Document type: text, markdown, pdf_text, html
    /// </summary>
    public string DocumentType { get; set; } = "text";

    /// <summary>
    /// Document content - corresponds to Document.pageContent in LangChain
    /// For parent documents: full content. For chunks: chunk content only.
    /// </summary>
    public string Content { get; set; } = string.Empty;

    /// <summary>
    /// Content length in characters
    /// </summary>
    public int ContentLength { get; set; } = 0;

    /// <summary>
    /// Document metadata as JSONB - corresponds to Document.metadata in LangChain
    /// </summary>
    public string Metadata { get; set; } = "{}";

    /// <summary>
    /// Document tags for filtering
    /// </summary>
    public string[] Tags { get; set; } = Array.Empty<string>();

    /// <summary>
    /// Vector embedding (1536 dimensions for OpenAI embeddings)
    /// </summary>
    public Vector? Embedding { get; set; }

    /// <summary>
    /// Creation timestamp
    /// </summary>
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    /// <summary>
    /// Last update timestamp
    /// </summary>
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}
