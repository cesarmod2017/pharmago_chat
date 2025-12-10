# Configuracao do PharmaGO Chat UI

Este documento descreve como configurar o modulo de chat para diferentes ambientes.

## Modos de Operacao

O pacote `pharmago_chat_ui` suporta dois modos de operacao:

### 1. Modo Demonstracao (Mock)

Usado para testes de UI sem necessidade de backend. As respostas sao simuladas localmente.

```dart
// example/lib/main.dart
const bool _useDemoMode = true;  // Ativa modo demonstracao
```

**Caracteristicas:**
- Nao requer backend rodando
- Respostas pre-definidas baseadas em palavras-chave
- Ideal para testes de interface e desenvolvimento de UI

### 2. Modo Real (gRPC)

Usado para comunicacao efetiva com o servidor gRPC.

```dart
// example/lib/main.dart
const bool _useDemoMode = false;  // Ativa modo real
```

**Caracteristicas:**
- Requer backend `PharmaGo.Chat.Grpc` rodando
- Respostas via IA (Claude/OpenAI)
- Suporte a streaming em tempo real

## Configuracao de Endpoints

### Arquivo Principal: `chat_environment.dart`

```dart
// lib/modules/chat/config/chat_environment.dart

// Configuracao padrao DEBUG (localhost)
static const String _debugHost = 'localhost';
static const int _debugPort = 5144;
static const bool _debugUseTls = false;

// Configuracao padrao RELEASE (producao)
static String _releaseHost = 'chat.pharmago.com.br';
static const int _releasePort = 443;
static const bool _releaseUseTls = true;
```

### Configuracao Programatica

```dart
// Antes de inicializar o app:

// Opcao 1: Configurar endpoint customizado
ChatEnvironment.configure(
  host: 'staging.empresa.com',
  port: 8443,
  useTls: true,
);

// Opcao 2: Apenas alterar host de producao
ChatEnvironment.setReleaseHost('chat.minhaempresa.com.br');

// Opcao 3: Resetar para configuracao padrao
ChatEnvironment.reset();
```

### Verificar Configuracao Atual

```dart
print(ChatEnvironment.description);
// Saida: [DEBUG] localhost:5144 (insecure)
// Ou:    [RELEASE] chat.pharmago.com.br:443 (TLS)
```

## Configuracao do Backend

### Arquivo: `PharmaGo.Chat.Grpc/Properties/launchSettings.json`

```json
{
  "profiles": {
    "PharmaGo.Chat.Grpc": {
      "applicationUrl": "http://localhost:5144",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development",
        "ENVIRONMENT": "local"
      }
    }
  }
}
```

### Arquivo: `appsettings.json`

Configuracoes principais do backend:

```json
{
  "ChatSettings": {
    "AI": {
      "DefaultModel": "claude",
      "Claude": {
        "ApiKey": "${CLAUDE_API_KEY}",
        "Model": "claude-sonnet-4-20250514"
      }
    },
    "Redis": {
      "Host": "${REDIS_HOST}",
      "Database": 3
    },
    "Postgres": {
      "ConnectionString": "Host=${DB_HOST};..."
    }
  }
}
```

## Arquivos de Entrada

### `main.dart` (Padrao)

```bash
flutter run                           # Debug com modo demo
flutter run --release                 # Release com conexao real
```

### `main_real.dart` (Forcando Conexao Real)

```bash
flutter run -t lib/main_real.dart     # Debug com conexao real
flutter run --release -t lib/main_real.dart  # Release
```

## Iniciando o Backend

```bash
cd PharmaGo.Chat.Grpc
dotnet run
```

O servidor inicia em `http://localhost:5144` (HTTP/2 para gRPC).

## Checklist para Ambiente Real

1. [ ] Backend `PharmaGo.Chat.Grpc` rodando
2. [ ] Redis disponivel e configurado
3. [ ] PostgreSQL com migrations aplicadas
4. [ ] API keys configuradas (Claude e/ou OpenAI)
5. [ ] `_useDemoMode = false` no `main.dart`
6. [ ] Endpoint correto configurado em `ChatEnvironment`

## Troubleshooting

### Erro: "Falha na conexao"

1. Verifique se o backend esta rodando:
   ```bash
   curl http://localhost:5144
   ```

2. Verifique os logs do backend para erros de configuracao

3. Confirme que a porta 5144 nao esta bloqueada

### Erro: "gRPC connection refused"

- Em Windows, pode ser necessario permitir HTTP/2 sem TLS:
  ```bash
  setx DOTNET_SYSTEM_NET_HTTP_SOCKETSHTTPHANDLER_HTTP2UNENCRYPTEDSUPPORT true
  ```

### Respostas nao chegam

1. Verifique se as API keys estao configuradas no backend
2. Verifique conexao com Redis
3. Verifique logs do backend para erros de IA

## Variaveis de Ambiente do Backend

| Variavel | Descricao | Exemplo |
|----------|-----------|---------|
| CLAUDE_API_KEY | Chave API Anthropic | sk-ant-... |
| OPENAI_API_KEY | Chave API OpenAI | sk-... |
| REDIS_HOST | Host do Redis | localhost:6379 |
| REDIS_PASS | Senha do Redis | (vazio ou senha) |
| DB_HOST | Host PostgreSQL | localhost |
| DB_PORT | Porta PostgreSQL | 5432 |
| DB_NAME | Nome do banco | pharmago_chat |
| DB_USER | Usuario | postgres |
| DB_PASSWORD | Senha | (senha) |
