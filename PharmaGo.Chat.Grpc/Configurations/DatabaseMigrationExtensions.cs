using Microsoft.EntityFrameworkCore;
using PharmaGo.Chat.Grpc.Data.Context;

namespace PharmaGo.Chat.Grpc.Configurations;

public static class DatabaseMigrationExtensions
{
    /// <summary>
    /// Apply pending database migrations automatically on application startup
    /// </summary>
    /// <param name="app">The WebApplication instance</param>
    /// <returns>The WebApplication instance for method chaining</returns>
    public static WebApplication ApplyDatabaseMigrations(this WebApplication app)
    {
        using (var scope = app.Services.CreateScope())
        {
            var services = scope.ServiceProvider;
            try
            {
                Console.WriteLine("Initializing database migration process...");

                var dbContext = services.GetRequiredService<ChatDbContext>();
                var configuration = services.GetRequiredService<IConfiguration>();

                Console.WriteLine(dbContext.Database.GetConnectionString());
                Console.WriteLine("Checking pending migrations...");
                var pendingMigrations = dbContext.Database.GetPendingMigrations();

                if (pendingMigrations.Any())
                {
                    Console.WriteLine($"Pending Migrations Found: {string.Join(", ", pendingMigrations)}");
                    Console.WriteLine("Applying migrations...");
                    dbContext.Database.Migrate();
                    Console.WriteLine("Migrations applied successfully.");
                }
                else
                {
                    Console.WriteLine("No pending migrations found. Database is up to date.");
                }

                Console.WriteLine("Migration process completed.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error during migration: {ex.Message}");
            }
        }

        return app;
    }
}
