using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PharmaGo.Chat.Grpc.Models.Entities.Maps;

public class TransferRequestEntityMap : IEntityTypeConfiguration<TransferRequestEntity>
{
    public void Configure(EntityTypeBuilder<TransferRequestEntity> entity)
    {
        entity.ToTable("transfer_requests");

        entity.HasKey(e => e.Id).HasName("pk_transfer_requests");

        entity.Property(e => e.Id).HasColumnName("id");
        entity.Property(e => e.SessionId).HasColumnName("session_id");
        entity.Property(e => e.Reason).HasColumnName("reason").HasMaxLength(500);
        entity.Property(e => e.Priority).HasColumnName("priority");
        entity.Property(e => e.Status).HasColumnName("status").HasMaxLength(50);
        entity.Property(e => e.RequestedAt).HasColumnName("requested_at").HasColumnType("timestamptz");
        entity.Property(e => e.AcceptedAt).HasColumnName("accepted_at").HasColumnType("timestamptz");
        entity.Property(e => e.CompletedAt).HasColumnName("completed_at").HasColumnType("timestamptz");
        entity.Property(e => e.OperatorId).HasColumnName("operator_id").HasMaxLength(100);
        entity.Property(e => e.OperatorName).HasColumnName("operator_name").HasMaxLength(200);
        entity.Property(e => e.Resolution).HasColumnName("resolution").HasMaxLength(100);
        entity.Property(e => e.Notes).HasColumnName("notes");

        // Indexes
        entity.HasIndex(e => e.SessionId).HasDatabaseName("ix_transfer_requests_session_id");
        entity.HasIndex(e => e.Status).HasDatabaseName("ix_transfer_requests_status");
        entity.HasIndex(e => e.Priority).HasDatabaseName("ix_transfer_requests_priority");
        entity.HasIndex(e => e.RequestedAt).HasDatabaseName("ix_transfer_requests_requested_at");
    }
}
