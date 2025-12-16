namespace PharmaGo.Chat.Grpc.Services.Chat;

/// <summary>
/// Helper class for replacing placeholder variables in prompts and welcome messages.
/// Supported placeholders: {appName}, {client}, {agentName}, {type}, {userName}, {userEmail}, {language}, {erpName}
/// </summary>
public static class PromptVariableReplacer
{
    /// <summary>
    /// Replaces all placeholder variables in the input text with their corresponding values.
    /// </summary>
    /// <param name="text">The text containing placeholders to replace</param>
    /// <param name="context">The context containing values for replacement</param>
    /// <returns>The text with all placeholders replaced</returns>
    public static string Replace(string? text, PromptVariableContext context)
    {
        if (string.IsNullOrEmpty(text))
        {
            return string.Empty;
        }

        return text
            .Replace("{appName}", context.AppName ?? string.Empty)
            .Replace("{client}", context.Client ?? string.Empty)
            .Replace("{agentName}", context.AgentName ?? string.Empty)
            .Replace("{type}", context.Type ?? string.Empty)
            .Replace("{userName}", context.UserName ?? string.Empty)
            .Replace("{userEmail}", context.UserEmail ?? string.Empty)
            .Replace("{language}", context.Language ?? string.Empty)
            .Replace("{erpName}", context.ErpName ?? string.Empty);
    }

    /// <summary>
    /// Creates a PromptVariableContext from a ChatCreateSessionRequest.
    /// </summary>
    public static PromptVariableContext FromCreateSessionRequest(
        string userName,
        string userEmail,
        string client,
        string agentName,
        string? erpName,
        string language,
        string type)
    {
        return new PromptVariableContext
        {
            AppName = client,
            Client = client,
            AgentName = agentName,
            Type = type,
            UserName = userName,
            UserEmail = userEmail,
            Language = language,
            ErpName = erpName ?? string.Empty
        };
    }

    /// <summary>
    /// Creates a PromptVariableContext from a SessionCacheData.
    /// </summary>
    public static PromptVariableContext FromSessionCacheData(SessionCacheData sessionData)
    {
        return new PromptVariableContext
        {
            AppName = sessionData.Client,
            Client = sessionData.Client,
            AgentName = sessionData.AgentName,
            Type = sessionData.Type,
            UserName = sessionData.UserName,
            UserEmail = sessionData.UserEmail,
            Language = sessionData.Language,
            ErpName = sessionData.ErpName ?? string.Empty
        };
    }
}

/// <summary>
/// Context containing all values for prompt variable replacement.
/// </summary>
public class PromptVariableContext
{
    /// <summary>
    /// Application name (typically same as Client)
    /// </summary>
    public string? AppName { get; set; }

    /// <summary>
    /// Client identifier: farmago, linx, aotech, etc.
    /// </summary>
    public string? Client { get; set; }

    /// <summary>
    /// Agent name for prompt customization
    /// </summary>
    public string? AgentName { get; set; }

    /// <summary>
    /// Type for filtering prompts and RAG documents
    /// </summary>
    public string? Type { get; set; }

    /// <summary>
    /// User's display name
    /// </summary>
    public string? UserName { get; set; }

    /// <summary>
    /// User's email address
    /// </summary>
    public string? UserEmail { get; set; }

    /// <summary>
    /// Language for responses: pt-BR, en-US, es-ES
    /// </summary>
    public string? Language { get; set; }

    /// <summary>
    /// ERP name (optional): linx, totvs, etc.
    /// </summary>
    public string? ErpName { get; set; }
}
