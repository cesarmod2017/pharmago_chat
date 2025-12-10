using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PharmaGo.Chat.Grpc.Models.Entities.Maps;

public class RagChunkMap : IEntityTypeConfiguration<RagChunk>
{
    public void Configure(EntityTypeBuilder<RagChunk> entity)
    {
        entity.ToTable("rag_chunks");

        entity.HasKey(e => e.Id).HasName("pk_rag_chunks");

        entity.Property(e => e.Id).HasColumnName("id");
        entity.Property(e => e.DocumentId).HasColumnName("document_id");
        entity.Property(e => e.ChunkIndex).HasColumnName("chunk_index");
        entity.Property(e => e.Content).HasColumnName("content");
        entity.Property(e => e.Embedding).HasColumnName("embedding").HasColumnType("vector(1536)");
        entity.Property(e => e.TokenCount).HasColumnName("token_count");
        entity.Property(e => e.CreatedAt).HasColumnName("created_at").HasColumnType("timestamptz");

        // Indexes
        entity.HasIndex(e => e.DocumentId).HasDatabaseName("ix_rag_chunks_document_id");
        entity.HasIndex(e => e.ChunkIndex).HasDatabaseName("ix_rag_chunks_chunk_index");

        // IVFFlat index for faster similarity search
        entity.HasIndex(e => e.Embedding)
              .HasMethod("ivfflat")
              .HasOperators("vector_cosine_ops")
              .HasStorageParameter("lists", 100)
              .HasDatabaseName("ix_rag_chunks_embedding");
    }
}
