# See https://aka.ms/customizecontainer to learn how to customize your debug container

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:10.0-preview AS base

# Install Kerberos libraries required by Npgsql for PostgreSQL authentication
RUN apt-get update && apt-get install -y --no-install-recommends \
    libkrb5-3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:10.0-preview AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["PharmaGo.Chat.Grpc/PharmaGo.Chat.Grpc.csproj", "PharmaGo.Chat.Grpc/"]
RUN dotnet restore "./PharmaGo.Chat.Grpc/PharmaGo.Chat.Grpc.csproj"
COPY . .
WORKDIR "/src/PharmaGo.Chat.Grpc"
RUN dotnet build "./PharmaGo.Chat.Grpc.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./PharmaGo.Chat.Grpc.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Environment variables
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

ENTRYPOINT ["dotnet", "PharmaGo.Chat.Grpc.dll"]
