import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../controllers/chat_controller.dart';
import '../providers/chat_provider.dart';

class ChatBinding implements Bindings {
  final Future<ClientChannel> Function() channelFactory;
  final String userName;
  final String userEmail;
  final Map<String, String>? metadata;
  final bool useStreaming;
  final String? preferredModel;

  ChatBinding({
    required this.channelFactory,
    required this.userName,
    required this.userEmail,
    this.metadata,
    this.useStreaming = true,
    this.preferredModel,
  });

  @override
  void dependencies() {
    Get.lazyPut<ChatProvider>(
      () => ChatProvider(channelFactory: channelFactory),
      fenix: true,
    );

    Get.lazyPut<ChatController>(
      () => ChatController(
        provider: Get.find<ChatProvider>(),
        userName: userName,
        userEmail: userEmail,
        metadata: metadata,
        useStreaming: useStreaming,
        preferredModel: preferredModel,
      ),
      fenix: true,
    );
  }
}

class ChatBindingFactory {
  final Future<ClientChannel> Function() channelFactory;

  const ChatBindingFactory({required this.channelFactory});

  ChatBinding create({
    required String userName,
    required String userEmail,
    Map<String, String>? metadata,
    bool useStreaming = true,
    String? preferredModel,
  }) {
    return ChatBinding(
      channelFactory: channelFactory,
      userName: userName,
      userEmail: userEmail,
      metadata: metadata,
      useStreaming: useStreaming,
      preferredModel: preferredModel,
    );
  }
}
