using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PharmaGo.Chat.Grpc.Models.Entities.Maps;

public class RagDocumentMap : IEntityTypeConfiguration<RagDocument>
{
    public void Configure(EntityTypeBuilder<RagDocument> entity)
    {
        entity.ToTable("rag_documents");

        entity.HasKey(e => e.Id).HasName("pk_rag_documents");

        entity.Property(e => e.Id).HasColumnName("id");
        entity.Property(e => e.Title).HasColumnName("title").HasMaxLength(500);
        entity.Property(e => e.DocumentType).HasColumnName("document_type").HasMaxLength(50);
        entity.Property(e => e.Content).HasColumnName("content");
        entity.Property(e => e.ContentLength).HasColumnName("content_length");
        entity.Property(e => e.ChunkCount).HasColumnName("chunk_count");
        entity.Property(e => e.CreatedAt).HasColumnName("created_at").HasColumnType("timestamptz");
        entity.Property(e => e.UpdatedAt).HasColumnName("updated_at").HasColumnType("timestamptz");
        entity.Property(e => e.Metadata).HasColumnName("metadata").HasColumnType("jsonb");
        entity.Property(e => e.Tags).HasColumnName("tags").HasColumnType("text[]");

        // Indexes
        entity.HasIndex(e => e.Title).HasDatabaseName("ix_rag_documents_title");
        entity.HasIndex(e => e.DocumentType).HasDatabaseName("ix_rag_documents_document_type");
        entity.HasIndex(e => e.CreatedAt).HasDatabaseName("ix_rag_documents_created_at");
        entity.HasIndex(e => e.Tags).HasMethod("gin").HasDatabaseName("ix_rag_documents_tags");

        // Relationships
        entity.HasMany(e => e.Chunks)
              .WithOne(e => e.Document)
              .HasForeignKey(e => e.DocumentId)
              .OnDelete(DeleteBehavior.Cascade);
    }
}
