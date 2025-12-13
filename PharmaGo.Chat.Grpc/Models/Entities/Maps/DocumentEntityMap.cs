using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PharmaGo.Chat.Grpc.Models.Entities.Maps;

public class DocumentEntityMap : IEntityTypeConfiguration<DocumentEntity>
{
    public void Configure(EntityTypeBuilder<DocumentEntity> entity)
    {
        entity.ToTable("documents");

        entity.HasKey(e => e.Id).HasName("pk_documents");

        entity.Property(e => e.Id)
              .HasColumnName("id")
              .UseIdentityAlwaysColumn();

        entity.Property(e => e.Title)
              .HasColumnName("title")
              .HasMaxLength(500);

        entity.Property(e => e.DocumentType)
              .HasColumnName("document_type")
              .HasMaxLength(50);

        entity.Property(e => e.Type)
              .HasColumnName("type")
              .HasMaxLength(100);

        entity.Property(e => e.Content)
              .HasColumnName("content");

        entity.Property(e => e.ContentLength)
              .HasColumnName("content_length");

        entity.Property(e => e.Metadata)
              .HasColumnName("metadata")
              .HasColumnType("jsonb");

        entity.Property(e => e.Tags)
              .HasColumnName("tags")
              .HasColumnType("text[]");

        entity.Property(e => e.Embedding)
              .HasColumnName("embedding")
              .HasColumnType("vector(1536)");

        entity.Property(e => e.CreatedAt)
              .HasColumnName("created_at")
              .HasColumnType("timestamptz");

        entity.Property(e => e.UpdatedAt)
              .HasColumnName("updated_at")
              .HasColumnType("timestamptz");

        // Chunking fields
        entity.Property(e => e.ParentDocumentId)
              .HasColumnName("parent_document_id");

        entity.Property(e => e.ChunkIndex)
              .HasColumnName("chunk_index");

        entity.Property(e => e.StartChar)
              .HasColumnName("start_char");

        entity.Property(e => e.EndChar)
              .HasColumnName("end_char");

        // Indexes
        entity.HasIndex(e => e.Title).HasDatabaseName("ix_documents_title");
        entity.HasIndex(e => e.DocumentType).HasDatabaseName("ix_documents_document_type");
        entity.HasIndex(e => e.Type).HasDatabaseName("ix_documents_type");
        entity.HasIndex(e => e.CreatedAt).HasDatabaseName("ix_documents_created_at");
        entity.HasIndex(e => e.Tags).HasMethod("gin").HasDatabaseName("ix_documents_tags");

        // IVFFlat index for faster similarity search (cosine distance)
        entity.HasIndex(e => e.Embedding)
              .HasMethod("ivfflat")
              .HasOperators("vector_cosine_ops")
              .HasStorageParameter("lists", 100)
              .HasDatabaseName("ix_documents_embedding");

        // Index for parent document lookup
        entity.HasIndex(e => e.ParentDocumentId)
              .HasDatabaseName("ix_documents_parent_document_id");
    }
}
