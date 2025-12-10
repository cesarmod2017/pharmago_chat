using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Pgvector;

#nullable disable

namespace PharmaGo.Chat.Grpc.Migrations
{
    /// <inheritdoc />
    public partial class InicialBranch : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("Npgsql:PostgresExtension:vector", ",,");

            migrationBuilder.CreateTable(
                name: "chat_sessions",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    user_name = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: false),
                    user_email = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: false),
                    status = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    created_at = table.Column<DateTime>(type: "timestamptz", nullable: false),
                    last_activity = table.Column<DateTime>(type: "timestamptz", nullable: false),
                    ended_at = table.Column<DateTime>(type: "timestamptz", nullable: true),
                    message_count = table.Column<int>(type: "integer", nullable: false),
                    total_tokens = table.Column<int>(type: "integer", nullable: false),
                    current_operator_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    metadata = table.Column<string>(type: "jsonb", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_chat_sessions", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "rag_documents",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    title = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false),
                    document_type = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    content = table.Column<string>(type: "text", nullable: false),
                    content_length = table.Column<int>(type: "integer", nullable: false),
                    chunk_count = table.Column<int>(type: "integer", nullable: false),
                    created_at = table.Column<DateTime>(type: "timestamptz", nullable: false),
                    updated_at = table.Column<DateTime>(type: "timestamptz", nullable: false),
                    metadata = table.Column<string>(type: "jsonb", nullable: false),
                    tags = table.Column<string[]>(type: "text[]", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_rag_documents", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "chat_messages",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    session_id = table.Column<Guid>(type: "uuid", nullable: false),
                    role = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    content = table.Column<string>(type: "text", nullable: false),
                    timestamp = table.Column<DateTime>(type: "timestamptz", nullable: false),
                    model_used = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    tokens_used = table.Column<int>(type: "integer", nullable: false),
                    sender_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    sender_name = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_chat_messages", x => x.id);
                    table.ForeignKey(
                        name: "FK_chat_messages_chat_sessions_session_id",
                        column: x => x.session_id,
                        principalTable: "chat_sessions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "transfer_requests",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    session_id = table.Column<Guid>(type: "uuid", nullable: false),
                    reason = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false),
                    priority = table.Column<int>(type: "integer", nullable: false),
                    status = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    requested_at = table.Column<DateTime>(type: "timestamptz", nullable: false),
                    accepted_at = table.Column<DateTime>(type: "timestamptz", nullable: true),
                    completed_at = table.Column<DateTime>(type: "timestamptz", nullable: true),
                    operator_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    operator_name = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true),
                    resolution = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    notes = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_transfer_requests", x => x.id);
                    table.ForeignKey(
                        name: "FK_transfer_requests_chat_sessions_session_id",
                        column: x => x.session_id,
                        principalTable: "chat_sessions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "rag_chunks",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    document_id = table.Column<Guid>(type: "uuid", nullable: false),
                    chunk_index = table.Column<int>(type: "integer", nullable: false),
                    content = table.Column<string>(type: "text", nullable: false),
                    embedding = table.Column<Vector>(type: "vector(1536)", nullable: true),
                    token_count = table.Column<int>(type: "integer", nullable: false),
                    created_at = table.Column<DateTime>(type: "timestamptz", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_rag_chunks", x => x.id);
                    table.ForeignKey(
                        name: "FK_rag_chunks_rag_documents_document_id",
                        column: x => x.document_id,
                        principalTable: "rag_documents",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "ix_chat_messages_role",
                table: "chat_messages",
                column: "role");

            migrationBuilder.CreateIndex(
                name: "ix_chat_messages_session_id",
                table: "chat_messages",
                column: "session_id");

            migrationBuilder.CreateIndex(
                name: "ix_chat_messages_timestamp",
                table: "chat_messages",
                column: "timestamp");

            migrationBuilder.CreateIndex(
                name: "ix_chat_sessions_created_at",
                table: "chat_sessions",
                column: "created_at");

            migrationBuilder.CreateIndex(
                name: "ix_chat_sessions_last_activity",
                table: "chat_sessions",
                column: "last_activity");

            migrationBuilder.CreateIndex(
                name: "ix_chat_sessions_status",
                table: "chat_sessions",
                column: "status");

            migrationBuilder.CreateIndex(
                name: "ix_chat_sessions_user_email",
                table: "chat_sessions",
                column: "user_email");

            migrationBuilder.CreateIndex(
                name: "ix_rag_chunks_chunk_index",
                table: "rag_chunks",
                column: "chunk_index");

            migrationBuilder.CreateIndex(
                name: "ix_rag_chunks_document_id",
                table: "rag_chunks",
                column: "document_id");

            migrationBuilder.CreateIndex(
                name: "ix_rag_chunks_embedding",
                table: "rag_chunks",
                column: "embedding")
                .Annotation("Npgsql:IndexMethod", "ivfflat")
                .Annotation("Npgsql:IndexOperators", new[] { "vector_cosine_ops" })
                .Annotation("Npgsql:StorageParameter:lists", 100);

            migrationBuilder.CreateIndex(
                name: "ix_rag_documents_created_at",
                table: "rag_documents",
                column: "created_at");

            migrationBuilder.CreateIndex(
                name: "ix_rag_documents_document_type",
                table: "rag_documents",
                column: "document_type");

            migrationBuilder.CreateIndex(
                name: "ix_rag_documents_tags",
                table: "rag_documents",
                column: "tags")
                .Annotation("Npgsql:IndexMethod", "gin");

            migrationBuilder.CreateIndex(
                name: "ix_rag_documents_title",
                table: "rag_documents",
                column: "title");

            migrationBuilder.CreateIndex(
                name: "ix_transfer_requests_priority",
                table: "transfer_requests",
                column: "priority");

            migrationBuilder.CreateIndex(
                name: "ix_transfer_requests_requested_at",
                table: "transfer_requests",
                column: "requested_at");

            migrationBuilder.CreateIndex(
                name: "ix_transfer_requests_session_id",
                table: "transfer_requests",
                column: "session_id");

            migrationBuilder.CreateIndex(
                name: "ix_transfer_requests_status",
                table: "transfer_requests",
                column: "status");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "chat_messages");

            migrationBuilder.DropTable(
                name: "rag_chunks");

            migrationBuilder.DropTable(
                name: "transfer_requests");

            migrationBuilder.DropTable(
                name: "rag_documents");

            migrationBuilder.DropTable(
                name: "chat_sessions");
        }
    }
}
