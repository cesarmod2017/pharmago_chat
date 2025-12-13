using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PharmaGo.Chat.Grpc.Models.Entities.Maps;

public class ChatSessionMap : IEntityTypeConfiguration<ChatSession>
{
    public void Configure(EntityTypeBuilder<ChatSession> entity)
    {
        entity.ToTable("chat_sessions");

        entity.HasKey(e => e.Id).HasName("pk_chat_sessions");

        entity.Property(e => e.Id).HasColumnName("id");
        entity.Property(e => e.UserName).HasColumnName("user_name").HasMaxLength(200);
        entity.Property(e => e.UserEmail).HasColumnName("user_email").HasMaxLength(200);
        entity.Property(e => e.Status).HasColumnName("status").HasMaxLength(50);
        entity.Property(e => e.CreatedAt).HasColumnName("created_at").HasColumnType("timestamptz");
        entity.Property(e => e.LastActivity).HasColumnName("last_activity").HasColumnType("timestamptz");
        entity.Property(e => e.EndedAt).HasColumnName("ended_at").HasColumnType("timestamptz");
        entity.Property(e => e.MessageCount).HasColumnName("message_count");
        entity.Property(e => e.TotalTokens).HasColumnName("total_tokens");
        entity.Property(e => e.CurrentOperatorId).HasColumnName("current_operator_id").HasMaxLength(100);
        entity.Property(e => e.Metadata).HasColumnName("metadata").HasColumnType("jsonb");

        // New multi-client/agent fields
        entity.Property(e => e.Client).HasColumnName("client").HasMaxLength(100);
        entity.Property(e => e.AgentName).HasColumnName("agent_name").HasMaxLength(200);
        entity.Property(e => e.ErpName).HasColumnName("erp_name").HasMaxLength(100);
        entity.Property(e => e.Language).HasColumnName("language").HasMaxLength(10);
        entity.Property(e => e.Type).HasColumnName("type").HasMaxLength(100);

        // Indexes
        entity.HasIndex(e => e.UserEmail).HasDatabaseName("ix_chat_sessions_user_email");
        entity.HasIndex(e => e.Status).HasDatabaseName("ix_chat_sessions_status");
        entity.HasIndex(e => e.CreatedAt).HasDatabaseName("ix_chat_sessions_created_at");
        entity.HasIndex(e => e.LastActivity).HasDatabaseName("ix_chat_sessions_last_activity");
        entity.HasIndex(e => e.Client).HasDatabaseName("ix_chat_sessions_client");
        entity.HasIndex(e => e.Type).HasDatabaseName("ix_chat_sessions_type");

        // Relationships
        entity.HasMany(e => e.Messages)
              .WithOne(e => e.Session)
              .HasForeignKey(e => e.SessionId)
              .OnDelete(DeleteBehavior.Cascade);

        entity.HasMany(e => e.TransferRequests)
              .WithOne(e => e.Session)
              .HasForeignKey(e => e.SessionId)
              .OnDelete(DeleteBehavior.Cascade);
    }
}
