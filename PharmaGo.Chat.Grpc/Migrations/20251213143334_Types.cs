using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PharmaGo.Chat.Grpc.Migrations
{
    /// <inheritdoc />
    public partial class Types : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "type",
                table: "documents",
                type: "character varying(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "agent_name",
                table: "chat_sessions",
                type: "character varying(200)",
                maxLength: 200,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "client",
                table: "chat_sessions",
                type: "character varying(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "erp_name",
                table: "chat_sessions",
                type: "character varying(100)",
                maxLength: 100,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "language",
                table: "chat_sessions",
                type: "character varying(10)",
                maxLength: 10,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "type",
                table: "chat_sessions",
                type: "character varying(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "ix_documents_type",
                table: "documents",
                column: "type");

            migrationBuilder.CreateIndex(
                name: "ix_chat_sessions_client",
                table: "chat_sessions",
                column: "client");

            migrationBuilder.CreateIndex(
                name: "ix_chat_sessions_type",
                table: "chat_sessions",
                column: "type");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "ix_documents_type",
                table: "documents");

            migrationBuilder.DropIndex(
                name: "ix_chat_sessions_client",
                table: "chat_sessions");

            migrationBuilder.DropIndex(
                name: "ix_chat_sessions_type",
                table: "chat_sessions");

            migrationBuilder.DropColumn(
                name: "type",
                table: "documents");

            migrationBuilder.DropColumn(
                name: "agent_name",
                table: "chat_sessions");

            migrationBuilder.DropColumn(
                name: "client",
                table: "chat_sessions");

            migrationBuilder.DropColumn(
                name: "erp_name",
                table: "chat_sessions");

            migrationBuilder.DropColumn(
                name: "language",
                table: "chat_sessions");

            migrationBuilder.DropColumn(
                name: "type",
                table: "chat_sessions");
        }
    }
}
