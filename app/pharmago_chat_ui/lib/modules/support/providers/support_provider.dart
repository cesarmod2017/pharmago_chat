import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';
import 'package:pharmago_chat_ui/modules/chat/providers/chat_provider.dart'
    show GrpcChannelFactory;

class SupportProvider {
  SupportServiceClient? _client;
  final GrpcChannelFactory _channelFactory;

  SupportProvider({required GrpcChannelFactory channelFactory})
      : _channelFactory = channelFactory;

  Future<SupportServiceClient> get client async {
    if (_client == null) {
      final channel = await _channelFactory();
      _client = SupportServiceClient(channel);
    }
    return _client!;
  }

  void resetClient() {
    _client = null;
  }

  void dispose() {
    _client = null;
  }

  Future<SupportRequestTransferResponse> requestTransfer({
    required String sessionId,
    required String reason,
    int priority = 3,
  }) async {
    final grpcClient = await client;
    final request = SupportRequestTransferRequest(
      sessionId: sessionId,
      reason: reason,
      priority: priority,
    );
    return grpcClient.requestTransfer(request);
  }

  Future<SupportAcceptTransferResponse> acceptTransfer({
    required String transferId,
    required String operatorId,
    required String operatorName,
  }) async {
    final grpcClient = await client;
    final request = SupportAcceptTransferRequest(
      transferId: transferId,
      operatorId: operatorId,
      operatorName: operatorName,
    );
    return grpcClient.acceptTransfer(request);
  }

  Future<SupportEndSupportSessionResponse> endSupportSession({
    required String sessionId,
    required String operatorId,
    required String resolution,
    String? notes,
  }) async {
    final grpcClient = await client;
    final request = SupportEndSupportSessionRequest(
      sessionId: sessionId,
      operatorId: operatorId,
      resolution: resolution,
      notes: notes,
    );
    return grpcClient.endSupportSession(request);
  }

  Future<SupportSendSupportMessageResponse> sendSupportMessage({
    required String sessionId,
    required String senderId,
    required String senderType,
    required String message,
  }) async {
    final grpcClient = await client;
    final request = SupportSendSupportMessageRequest(
      sessionId: sessionId,
      senderId: senderId,
      senderType: senderType,
      message: message,
    );
    return grpcClient.sendSupportMessage(request);
  }

  Stream<SupportMessage> streamSupportMessages({
    required String sessionId,
    required String subscriberId,
  }) async* {
    final grpcClient = await client;
    final request = SupportStreamSupportMessagesRequest(
      sessionId: sessionId,
      subscriberId: subscriberId,
    );
    yield* grpcClient.streamSupportMessages(request);
  }

  Future<SupportListPendingTransfersResponse> listPendingTransfers({
    int limit = 20,
    int offset = 0,
  }) async {
    final grpcClient = await client;
    final request = SupportListPendingTransfersRequest(
      limit: limit,
      offset: offset,
    );
    return grpcClient.listPendingTransfers(request);
  }

  Future<SupportQueueStatusResponse> getQueueStatus() async {
    final grpcClient = await client;
    final request = Empty();
    return grpcClient.getQueueStatus(request);
  }
}
