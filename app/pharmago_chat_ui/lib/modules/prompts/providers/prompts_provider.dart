import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';
import 'package:pharmago_chat_ui/modules/chat/providers/chat_provider.dart'
    show GrpcChannelFactory;

class PromptsProvider {
  PromptServiceClient? _client;
  final GrpcChannelFactory _channelFactory;

  PromptsProvider({required GrpcChannelFactory channelFactory})
      : _channelFactory = channelFactory;

  Future<PromptServiceClient> get client async {
    if (_client == null) {
      final channel = await _channelFactory();
      _client = PromptServiceClient(channel);
    }
    return _client!;
  }

  void resetClient() {
    _client = null;
  }

  void dispose() {
    _client = null;
  }

  Future<CreatePromptResponse> createPrompt({
    required String name,
    required String type,
    required String prompt,
    required String welcomeMessage,
  }) async {
    final grpcClient = await client;
    final request = CreatePromptRequest(
      name: name,
      type: type,
      prompt: prompt,
      welcomeMessage: welcomeMessage,
    );
    return grpcClient.createPrompt(request);
  }

  Future<UpdatePromptResponse> updatePrompt({
    required String id,
    required String name,
    required String type,
    required String prompt,
    required String welcomeMessage,
  }) async {
    final grpcClient = await client;
    final request = UpdatePromptRequest(
      id: id,
      name: name,
      type: type,
      prompt: prompt,
      welcomeMessage: welcomeMessage,
    );
    return grpcClient.updatePrompt(request);
  }

  Future<DeletePromptResponse> deletePrompt({
    required String id,
  }) async {
    final grpcClient = await client;
    final request = DeletePromptRequest(id: id);
    return grpcClient.deletePrompt(request);
  }

  Future<PromptInfo> getPrompt({
    required String id,
  }) async {
    final grpcClient = await client;
    final request = GetPromptRequest(id: id);
    return grpcClient.getPrompt(request);
  }

  Future<ListPromptsResponse> listPrompts({
    int limit = 50,
    int offset = 0,
  }) async {
    final grpcClient = await client;
    final request = ListPromptsRequest(
      limit: limit,
      offset: offset,
    );
    return grpcClient.listPrompts(request);
  }

  Future<ListPromptsResponse> getPromptsByType({
    required String type,
    int limit = 50,
    int offset = 0,
  }) async {
    final grpcClient = await client;
    final request = GetPromptsByTypeRequest(
      type: type,
      limit: limit,
      offset: offset,
    );
    return grpcClient.getPromptsByType(request);
  }
}
