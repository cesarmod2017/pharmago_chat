using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Models.Entities;

namespace PharmaGo.Chat.Grpc.Data.Context;

public class ChatDbContext : DbContext
{
    public ChatDbContext(DbContextOptions<ChatDbContext> options) : base(options)
    {
    }

    public DbSet<ChatSession> Sessions { get; set; } = null!;
    public DbSet<ChatMessageEntity> Messages { get; set; } = null!;
    public DbSet<TransferRequestEntity> TransferRequests { get; set; } = null!;
    public DbSet<RagDocument> Documents { get; set; } = null!;
    public DbSet<RagChunk> Chunks { get; set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Enable pgvector extension
        modelBuilder.HasPostgresExtension("vector");

        // Apply all entity configurations from the assembly
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(ChatDbContext).Assembly);
    }
}
