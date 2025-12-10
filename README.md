# PharmaGO Chat

Sistema de chat inteligente para atendimento farmaceutico com suporte a RAG (Retrieval-Augmented Generation) e integracao com IA.

## Estrutura do Projeto

```
pharmago_chat/
├── PharmaGo.Chat.Grpc/          # Backend gRPC (.NET 10)
│   ├── Protos/                  # Definicoes Protocol Buffers
│   │   ├── Chat/                # Servico de chat
│   │   ├── Rag/                 # Servico RAG
│   │   └── Support/             # Servico de suporte
│   └── ...
├── app/
│   └── pharmago_chat_ui/        # Package Flutter para UI
└── docker-compose.yml           # Configuracao Docker
```

## Tecnologias

### Backend
- .NET 10
- gRPC + Protocol Buffers
- PostgreSQL com pgVector (busca vetorial)
- Redis (cache e sessoes)
- Entity Framework Core
- JWT Authentication
- Serilog (logging)
- HashiCorp Vault (secrets)

### Frontend
- Flutter/Dart
- Package reutilizavel para integracao

## Pre-requisitos

- .NET 10 SDK
- Flutter 3.35+
- PostgreSQL 15+ com extensao pgvector
- Redis 7+
- Docker (opcional)

## Configuracao

### Backend

1. Configure as variaveis de ambiente ou `appsettings.json`:
   - Connection strings (PostgreSQL, Redis)
   - JWT secret
   - Configuracoes de IA

2. Execute as migrations:
```bash
cd PharmaGo.Chat.Grpc
dotnet ef database update
```

3. Inicie o servidor:
```bash
dotnet run --project PharmaGo.Chat.Grpc
```

### Flutter Package

```bash
cd app/pharmago_chat_ui
flutter pub get
```

Para gerar os arquivos Protocol Buffers:
```bash
./generate_proto.bat
```

## Docker

```bash
docker-compose up -d
```

## Servicos gRPC

- **ChatService**: Gerenciamento de conversas e mensagens
- **RagService**: Busca vetorial e recuperacao de contexto
- **SupportService**: Atendimento e suporte ao cliente

## Licenca

Proprietario - PharmaGO
