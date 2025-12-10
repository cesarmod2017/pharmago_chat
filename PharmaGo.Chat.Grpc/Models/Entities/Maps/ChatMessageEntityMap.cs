using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PharmaGo.Chat.Grpc.Models.Entities.Maps;

public class ChatMessageEntityMap : IEntityTypeConfiguration<ChatMessageEntity>
{
    public void Configure(EntityTypeBuilder<ChatMessageEntity> entity)
    {
        entity.ToTable("chat_messages");

        entity.HasKey(e => e.Id).HasName("pk_chat_messages");

        entity.Property(e => e.Id).HasColumnName("id");
        entity.Property(e => e.SessionId).HasColumnName("session_id");
        entity.Property(e => e.Role).HasColumnName("role").HasMaxLength(50);
        entity.Property(e => e.Content).HasColumnName("content");
        entity.Property(e => e.Timestamp).HasColumnName("timestamp").HasColumnType("timestamptz");
        entity.Property(e => e.ModelUsed).HasColumnName("model_used").HasMaxLength(100);
        entity.Property(e => e.TokensUsed).HasColumnName("tokens_used");
        entity.Property(e => e.SenderId).HasColumnName("sender_id").HasMaxLength(100);
        entity.Property(e => e.SenderName).HasColumnName("sender_name").HasMaxLength(200);

        // Indexes
        entity.HasIndex(e => e.SessionId).HasDatabaseName("ix_chat_messages_session_id");
        entity.HasIndex(e => e.Timestamp).HasDatabaseName("ix_chat_messages_timestamp");
        entity.HasIndex(e => e.Role).HasDatabaseName("ix_chat_messages_role");
    }
}
