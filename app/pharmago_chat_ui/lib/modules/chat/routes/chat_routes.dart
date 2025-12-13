import 'package:get/get.dart';

import '../bindings/chat_binding.dart';
import '../pages/chat_page.dart';

abstract class ChatRoutes {
  static const chat = '/chat';
}

class ChatPages {
  final ChatBindingFactory bindingFactory;

  const ChatPages({required this.bindingFactory});

  List<GetPage> getPages({
    required String userName,
    required String userEmail,
    required String client,
    required String agentName,
    required String type,
    String? erpName,
    String language = 'pt-BR',
    Map<String, String>? metadata,
    bool useStreaming = true,
    String? preferredModel,
    Transition? transition,
  }) {
    return [
      GetPage(
        name: ChatRoutes.chat,
        page: () => const ChatPage(),
        binding: bindingFactory.create(
          userName: userName,
          userEmail: userEmail,
          client: client,
          agentName: agentName,
          type: type,
          erpName: erpName,
          language: language,
          metadata: metadata,
          useStreaming: useStreaming,
          preferredModel: preferredModel,
        ),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
    ];
  }

  GetPage getChatPage({
    required String userName,
    required String userEmail,
    required String client,
    required String agentName,
    required String type,
    String? erpName,
    String language = 'pt-BR',
    Map<String, String>? metadata,
    bool useStreaming = true,
    String? preferredModel,
    Transition? transition,
  }) {
    return GetPage(
      name: ChatRoutes.chat,
      page: () => const ChatPage(),
      binding: bindingFactory.create(
        userName: userName,
        userEmail: userEmail,
        client: client,
        agentName: agentName,
        type: type,
        erpName: erpName,
        language: language,
        metadata: metadata,
        useStreaming: useStreaming,
        preferredModel: preferredModel,
      ),
      transition: transition ?? Transition.rightToLeft,
      preventDuplicates: true,
    );
  }
}
