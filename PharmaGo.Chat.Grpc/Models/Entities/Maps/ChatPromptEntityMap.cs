using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PharmaGo.Chat.Grpc.Models.Entities.Maps;

public class ChatPromptEntityMap : IEntityTypeConfiguration<ChatPromptEntity>
{
    public void Configure(EntityTypeBuilder<ChatPromptEntity> entity)
    {
        entity.ToTable("chat_prompts");

        entity.HasKey(e => e.Id).HasName("pk_chat_prompts");

        entity.Property(e => e.Id).HasColumnName("id");
        entity.Property(e => e.Name).HasColumnName("name").HasMaxLength(200).IsRequired();
        entity.Property(e => e.Type).HasColumnName("type").HasMaxLength(100).IsRequired();
        entity.Property(e => e.Prompt).HasColumnName("prompt").HasColumnType("text").IsRequired();
        entity.Property(e => e.CreatedAt).HasColumnName("created_at").HasColumnType("timestamptz");
        entity.Property(e => e.UpdatedAt).HasColumnName("updated_at").HasColumnType("timestamptz");

        // Indexes
        entity.HasIndex(e => e.Type).HasDatabaseName("ix_chat_prompts_type");
        entity.HasIndex(e => e.Name).HasDatabaseName("ix_chat_prompts_name");
    }
}
