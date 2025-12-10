using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PharmaGo.Chat.Grpc.Migrations
{
    /// <inheritdoc />
    public partial class FixChunkingColumnNames : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // Rename columns from PascalCase to snake_case to match convention
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN \"ChunkIndex\" TO chunk_index;");
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN \"EndChar\" TO end_char;");
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN \"ParentDocumentId\" TO parent_document_id;");
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN \"StartChar\" TO start_char;");

            // Rename the index too
            migrationBuilder.Sql("ALTER INDEX \"IX_documents_ParentDocumentId\" RENAME TO ix_documents_parent_document_id;");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // Revert column names back to PascalCase
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN chunk_index TO \"ChunkIndex\";");
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN end_char TO \"EndChar\";");
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN parent_document_id TO \"ParentDocumentId\";");
            migrationBuilder.Sql("ALTER TABLE documents RENAME COLUMN start_char TO \"StartChar\";");

            // Revert index name
            migrationBuilder.Sql("ALTER INDEX ix_documents_parent_document_id RENAME TO \"IX_documents_ParentDocumentId\";");
        }
    }
}
