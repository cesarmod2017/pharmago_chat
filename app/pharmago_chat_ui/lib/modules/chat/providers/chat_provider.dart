import 'dart:async';

import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';

/// Factory function that creates a gRPC channel.
/// Returns dynamic to support both ClientChannel (native) and GrpcWebClientChannel (web).
typedef GrpcChannelFactory = Future<dynamic> Function();

class ChatProvider {
  ChatServiceClient? _client;
  final GrpcChannelFactory _channelFactory;

  ChatProvider({required GrpcChannelFactory channelFactory})
      : _channelFactory = channelFactory;

  Future<ChatServiceClient> get client async {
    if (_client == null) {
      final channel = await _channelFactory();
      // Both ClientChannel and GrpcWebClientChannel work with the generated client
      _client = ChatServiceClient(channel);
    }
    return _client!;
  }

  /// Reseta o cliente gRPC, forçando uma nova conexão na próxima chamada.
  /// Útil para reconexão após erros de rede.
  void resetClient() {
    _client = null;
  }

  /// Força uma reconexão recriando o cliente gRPC.
  /// Retorna true se a reconexão foi bem-sucedida.
  Future<bool> reconnect() async {
    resetClient();
    return await checkHealth();
  }

  void dispose() {
    _client = null;
  }

  Future<ChatCreateSessionResponse> createSession({
    required String name,
    required String email,
    required String client,
    required String agentName,
    String? erpName,
    String language = 'pt-BR',
    required String type,
    Map<String, String>? metadata,
  }) async {
    final grpcClient = await this.client;
    final request = ChatCreateSessionRequest(
      name: name,
      email: email,
      client: client,
      agentName: agentName,
      erpName: erpName ?? '',
      language: language,
      type: type,
      metadata: metadata?.entries,
    );
    return grpcClient.createSession(request);
  }

  Future<ChatSendMessageResponse> sendMessage({
    required String sessionId,
    required String message,
    bool useStreaming = false,
    String? preferredModel,
  }) async {
    final grpcClient = await client;
    final request = ChatSendMessageRequest(
      sessionId: sessionId,
      message: message,
      useStreaming: useStreaming,
      preferredModel: preferredModel,
    );
    return grpcClient.sendMessage(request);
  }

  Stream<ChatMessageChunk> sendMessageStream({
    required String sessionId,
    required String message,
    String? preferredModel,
  }) async* {
    final grpcClient = await client;
    final request = ChatSendMessageRequest(
      sessionId: sessionId,
      message: message,
      useStreaming: true,
      preferredModel: preferredModel,
    );
    yield* grpcClient.sendMessageStream(request);
  }

  Future<ChatGetHistoryResponse> getHistory({
    required String sessionId,
    int limit = 0,
    int offset = 0,
  }) async {
    final grpcClient = await client;
    final request = ChatGetHistoryRequest(
      sessionId: sessionId,
      limit: limit,
      offset: offset,
    );
    return grpcClient.getHistory(request);
  }

  Future<ChatEndSessionResponse> endSession({
    required String sessionId,
    String? reason,
  }) async {
    final grpcClient = await client;
    final request = ChatEndSessionRequest(
      sessionId: sessionId,
      reason: reason,
    );
    return grpcClient.endSession(request);
  }

  Future<ChatSessionInfo> getSessionInfo({
    required String sessionId,
  }) async {
    final grpcClient = await client;
    final request = ChatGetSessionInfoRequest(sessionId: sessionId);
    return grpcClient.getSessionInfo(request);
  }

  Future<ChatListActiveSessionsResponse> listActiveSessions({
    int limit = 20,
    int offset = 0,
    String? statusFilter,
  }) async {
    final grpcClient = await client;
    final request = ChatListActiveSessionsRequest(
      limit: limit,
      offset: offset,
      statusFilter: statusFilter,
    );
    return grpcClient.listActiveSessions(request);
  }

  /// Checks if the gRPC service is reachable by attempting a minimal operation.
  /// Returns true if the service is online, false otherwise.
  Future<bool> checkHealth() async {
    try {
      final grpcClient = await client;
      // Use ListActiveSessions with limit 0 as a lightweight health check
      final request = ChatListActiveSessionsRequest(limit: 0, offset: 0);
      await grpcClient.listActiveSessions(request);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Get chat history by user email from Redis (180 days TTL).
  /// Returns the last [limit] messages (default: 10).
  Future<ChatGetHistoryByEmailResponse> getHistoryByEmail({
    required String userEmail,
    int limit = 10,
  }) async {
    final grpcClient = await client;
    final request = ChatGetHistoryByEmailRequest(
      userEmail: userEmail,
      limit: limit,
    );
    return grpcClient.getHistoryByEmail(request);
  }
}
