import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';

typedef GrpcChannelFactory = Future<ClientChannel> Function();

class ChatProvider {
  ChatServiceClient? _client;
  final GrpcChannelFactory _channelFactory;

  ChatProvider({required GrpcChannelFactory channelFactory})
      : _channelFactory = channelFactory;

  Future<ChatServiceClient> get client async {
    if (_client == null) {
      final channel = await _channelFactory();
      _client = ChatServiceClient(channel);
    }
    return _client!;
  }

  void resetClient() {
    _client = null;
  }

  void dispose() {
    _client = null;
  }

  Future<ChatCreateSessionResponse> createSession({
    required String name,
    required String email,
    Map<String, String>? metadata,
  }) async {
    final grpcClient = await client;
    final request = ChatCreateSessionRequest(
      name: name,
      email: email,
      metadata: metadata,
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
}
