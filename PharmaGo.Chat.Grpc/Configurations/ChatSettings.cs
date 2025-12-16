using Newtonsoft.Json.Linq;
using System.Text.RegularExpressions;
using Vault;
using Vault.Client;

namespace PharmaGo.Chat.Grpc.Configurations;

public class ChatSettings
{
    public AISettings AI { get; set; } = new();
    public RedisSettings Redis { get; set; } = new();
    public PostgresSettings Postgres { get; set; } = new();
    public EmbeddingSettings Embedding { get; set; } = new();
    public SessionSettings Session { get; set; } = new();

    /// <summary>
    /// Loads configuration values from HashiCorp Vault based on ENVIRONMENT variable.
    /// Values with ${VARIABLE_NAME} placeholders in appsettings.json will be replaced with Vault secrets.
    /// </summary>
    public void LoadEnvironmentVault()
    {
        LoadEnvironmentFromKeyVault(this);
    }

    private void LoadEnvironmentFromKeyVault(object obj)
    {
        try
        {
            var vaultUrl = Environment.GetEnvironmentVariable("VAULT_URL") ?? "https://vault.modspace.com.br";
            var config = new VaultConfiguration(vaultUrl);
            var vaultClient = new VaultClient(config);
            vaultClient.SetToken("hvs.Nm4Uq1jz0rqizxkl2rngbiGy");

            var environment = Environment.GetEnvironmentVariable("ENVIRONMENT");

            // If ENVIRONMENT is not defined, use 'local' as default
            if (string.IsNullOrEmpty(environment))
            {
                environment = "local";
                Console.WriteLine("[VAULT] ENVIRONMENT variable not defined. Using 'local' as default in ChatSettings.");
            }

            Console.WriteLine($"[VAULT] Loading secrets for environment: {environment}");

            // Read secret from KV v2
            var resp = vaultClient.Secrets.KvV2Read($"pharmago-chat-{environment.ToLower()}", "kv");

            // Store Vault data as Dictionary for lookup
            Dictionary<string, object>? vaultData = null;
            if (resp.Data.Data != null)
            {
                var jObject = JObject.FromObject(resp.Data.Data);
                vaultData = jObject.ToObject<Dictionary<string, object>>();
            }

            if (vaultData == null)
            {
                Console.WriteLine("[VAULT] No data found in Vault secret.");
                return;
            }

            Console.WriteLine($"[VAULT] Found {vaultData.Count} keys in Vault.");

            // Iterate over object properties
            ProcessObjectProperties(obj, vaultData);

            Console.WriteLine("[VAULT] Configuration loaded successfully from Vault.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"[VAULT] Error accessing Vault in ChatSettings: {ex.Message}");
            Console.WriteLine("[VAULT] Continuing without Vault configurations...");
            // Don't propagate exception to allow application to continue
        }
    }

    /// <summary>
    /// Substitutes all ${VARIABLE} placeholders in the input string with values from Vault.
    /// Supports multiple placeholders in a single string (e.g., ConnectionStrings).
    /// </summary>
    private static string SubstituteEnvironmentVariables(string input, Dictionary<string, object> vaultData)
    {
        if (string.IsNullOrEmpty(input) || !input.Contains("${"))
        {
            return input;
        }

        return Regex.Replace(input, @"\$\{([^}]+)\}", match =>
        {
            string envVarName = match.Groups[1].Value;

            // Look up value in Vault
            if (vaultData.TryGetValue(envVarName, out var vaultValue))
            {
                return vaultValue?.ToString() ?? string.Empty;
            }
            else
            {
                Console.WriteLine($"[VAULT] Value not found in Vault for key: {envVarName}");
                return match.Value; // Keep original placeholder if not found
            }
        });
    }

    private void ProcessObjectProperties(object obj, Dictionary<string, object> vaultData)
    {
        foreach (var prop in obj.GetType().GetProperties())
        {
            if (prop.PropertyType == typeof(string))
            {
                var value = prop.GetValue(obj) as string;
                if (value != null && value.Contains("${"))
                {
                    // Use Regex to replace all ${VARIABLE} placeholders in the string
                    var substitutedValue = SubstituteEnvironmentVariables(value, vaultData);
                    prop.SetValue(obj, substitutedValue);
                }
            }
            else if (prop.PropertyType == typeof(int))
            {
                // Handle int properties that might need Vault values
                // These are typically not from Vault, but from appsettings
            }
            else if (prop.PropertyType.IsClass && prop.PropertyType != typeof(string) && !prop.PropertyType.IsGenericType)
            {
                // Recursively process nested objects
                var nestedObj = prop.GetValue(obj);
                if (nestedObj != null)
                {
                    ProcessObjectProperties(nestedObj, vaultData);
                }
            }
            else if (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(Dictionary<,>))
            {
                // Handle Dictionary properties like OpenAI.Models
                var dict = prop.GetValue(obj);
                if (dict is Dictionary<string, string> stringDict)
                {
                    foreach (var kvp in stringDict.ToList())
                    {
                        if (kvp.Value.Contains("${"))
                        {
                            stringDict[kvp.Key] = SubstituteEnvironmentVariables(kvp.Value, vaultData);
                        }
                    }
                }
            }
        }
    }
}

public class AISettings
{
    public string DefaultModel { get; set; } = "claude";
    public ClaudeSettings Claude { get; set; } = new();
    public OpenAISettings OpenAI { get; set; } = new();
}

public class ClaudeSettings
{
    public string ApiKey { get; set; } = string.Empty;
    public string ApiUrl { get; set; } = "https://api.anthropic.com/v1/messages";
    public string Model { get; set; } = "claude-sonnet-4-20250514";
    public int MaxTokens { get; set; } = 4096;
    public float Temperature { get; set; } = 0.7f;
    public string ApiVersion { get; set; } = "2023-06-01";
}

public class OpenAISettings
{
    public string ApiKey { get; set; } = string.Empty;
    public string ApiUrl { get; set; } = "https://api.openai.com/v1/chat/completions";
    public Dictionary<string, string> Models { get; set; } = new()
    {
        { "gpt-5.0", "gpt-5-0" },
        { "gpt-5.1", "gpt-5-1-preview" },
        { "gpt-4.1", "gpt-4.1-2025-04-14" }
    };
    public int MaxTokens { get; set; } = 4096;
    public float Temperature { get; set; } = 0.7f;
}

public class RedisSettings
{
    public string Host { get; set; } = "localhost:6379";
    public string Password { get; set; } = string.Empty;
    public int Database { get; set; } = 0;
    public int ConnectTimeout { get; set; } = 30000;
    public int SyncTimeout { get; set; } = 30000;
    public bool AbortOnConnectFail { get; set; } = false;
    public bool AllowAdmin { get; set; } = true;
    public int SessionExpirationMinutes { get; set; } = 60;
    public int HistoryExpirationHours { get; set; } = 24;
}

public class PostgresSettings
{
    public string ConnectionString { get; set; } = string.Empty;
    public int MaxPoolSize { get; set; } = 30;
    public int MinPoolSize { get; set; } = 5;
    public int CommandTimeout { get; set; } = 120;
}

public class EmbeddingSettings
{
    public string Provider { get; set; } = "openai"; // openai or custom
    public string Model { get; set; } = "text-embedding-3-small";
    public int Dimensions { get; set; } = 1536;
    public int MaxChunkSize { get; set; } = 500;
    public int ChunkOverlap { get; set; } = 50;
    public float DefaultSimilarityThreshold { get; set; } = 0.3f; // Lowered from 0.7 - semantic similarity rarely exceeds 0.5
    public int DefaultTopK { get; set; } = 5;
}

public class SessionSettings
{
    public int MaxIdleMinutes { get; set; } = 30;
    public int MaxSessionDurationMinutes { get; set; } = 120;
    public int MaxHistoryMessages { get; set; } = 50;
}
