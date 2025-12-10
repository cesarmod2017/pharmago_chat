Criar uma nova migration
  dotnet ef migrations add Document2--project .\PharmaGo.Chat.Grpc --context ChatDbContext --startup-project .\PharmaGo.Chat.Grpc
  Atualizar a migration na base de dados
            dotnet ef database update --project .\PharmaGo.Chat.Grpc --context ChatDbContext --startup-project .\PharmaGo.Chat.Grpc

