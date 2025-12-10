using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PharmaGo.Chat.Grpc.Migrations
{
    /// <inheritdoc />
    public partial class AddDocumentChunking : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ChunkIndex",
                table: "documents",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "EndChar",
                table: "documents",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "ParentDocumentId",
                table: "documents",
                type: "bigint",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "StartChar",
                table: "documents",
                type: "integer",
                nullable: true);

            // Create index for faster lookups of chunks by parent document
            migrationBuilder.CreateIndex(
                name: "IX_documents_ParentDocumentId",
                table: "documents",
                column: "ParentDocumentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_documents_ParentDocumentId",
                table: "documents");

            migrationBuilder.DropColumn(
                name: "ChunkIndex",
                table: "documents");

            migrationBuilder.DropColumn(
                name: "EndChar",
                table: "documents");

            migrationBuilder.DropColumn(
                name: "ParentDocumentId",
                table: "documents");

            migrationBuilder.DropColumn(
                name: "StartChar",
                table: "documents");
        }
    }
}
