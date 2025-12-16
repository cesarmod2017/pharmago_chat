import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatController? _controller;
  ChatProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const bool _useDemoMode = false;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    try {
      if (_useDemoMode) {
        _controller = _MockChatController();
      } else {
        _provider = ChatProvider(
          channelFactory: ChatEnvironment.channelFactory,
        );
        _controller = ChatController(
          provider: _provider!,
          userName: 'Usuario',
          userEmail: 'usuario@pharmago.com.br',
          client: 'Farma GO',
          agentName: 'Sofia Martinez',
          erpName: null,
          language: 'pt-BR',
          type: 'farmago',
          useStreaming: true,
          metadata: {
            'source': 'chat_app',
            'platform': defaultTargetPlatform.name,
          },
        );
      }

      Get.put<ChatController>(_controller!, tag: 'chat_page');

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _initError = e.toString();
      });
    }
  }

  @override
  void dispose() {
    Get.delete<ChatController>(tag: 'chat_page');
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Chat Page')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Erro ao inicializar o chat',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  _initError!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _initError = null;
                    });
                    _initializeChat();
                  },
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (!_isInitialized) {
      return Scaffold(
        appBar: AppBar(title: const Text('Chat Page')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Conectando ao servidor...'),
            ],
          ),
        ),
      );
    }

    // Example of custom theme (uncomment to use):
    // final customTheme = ChatThemeData.light(
    //   headerBackgroundColor: Colors.blue,
    //   headerTextColor: Colors.white,
    //   headerAvatarBackgroundColor: Colors.blue.shade700,
    //   headerAvatarTextColor: Colors.white,
    //   userBubbleColor: Colors.blue,
    //   userBubbleTextColor: Colors.white,
    //   assistantBubbleColor: Colors.grey.shade200,
    //   assistantBubbleTextColor: Colors.black87,
    //   sendButtonColor: Colors.blue,
    //   sendButtonIconColor: Colors.white,
    // );

    return Scaffold(
      body: SafeArea(
        child: ChatPageWidget(
          controller: _controller!,
          contact: ChatContactModel(
            name: 'Assistente PharmaGO',
            subtitle: _useDemoMode
                ? 'Modo Demo'
                : '${ChatEnvironment.host}:${ChatEnvironment.port}',
            isOnline: true,
            // avatarUrl: 'https://example.com/avatar.png', // Optional avatar URL
          ),
          onBackPressed: () => Navigator.of(context).pop(),
          headerActions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _controller!.clearMessages();
                if (_controller is _MockChatController) {
                  (_controller as _MockChatController).addWelcomeMessage();
                }
              },
              tooltip: 'Reiniciar chat',
            ),
          ],
          inputHintText: 'Digite sua mensagem...',
          // theme: customTheme, // Uncomment to use custom theme
          //
          // sendOnEnter: true => Enter sends on Windows/Web, Shift+Enter for newline
          // sendOnEnter: false => Ctrl+Enter sends on Windows/Web, Enter for newline
          // On mobile (Android/iOS), Enter never sends - only the send button does
          sendOnEnter: true,
          // sendButtonIcon: Icons.arrow_upward, // Custom send button icon
          //
          // Input field color customization (overrides theme values):
          // inputBackgroundColor: Colors.grey.shade100, // Background color
          // inputBorderColor: Colors.blue.shade200,     // Border color
          // inputHintColor: Colors.grey.shade400,       // Hint/placeholder color
          // inputTextColor: Colors.black87,             // Text color
        ),
      ),
    );
  }
}

class _MockChatController extends ChatController {
  _MockChatController()
    : super(
        provider: _MockChatProvider(),
        userName: 'Test User',
        userEmail: 'test@example.com',
        client: 'Farma GO',
        agentName: 'Assistente Demo',
        type: 'farmago',
        useStreaming: false,
      );

  @override
  void onInit() {
    super.onInit();
    sessionId.value = 'mock-session-id';
    addWelcomeMessage();
  }

  void addWelcomeMessage() {
    final welcomeMessage = ChatMessageModel.assistant(
      id: 'welcome-${DateTime.now().millisecondsSinceEpoch}',
      content:
          'Ola! Sou o assistente PharmaGO em modo de demonstracao. '
          'Como posso ajuda-lo hoje?',
      timestamp: DateTime.now(),
    );
    messages.add(welcomeMessage);
  }

  @override
  Future<void> sendMessage() async {
    final content = messageController.text.trim();
    if (content.isEmpty) return;

    messageController.clear();

    final userMessage = ChatMessageModel.user(
      id: 'user-${DateTime.now().millisecondsSinceEpoch}',
      content: content,
      status: MessageStatus.sent,
    );

    messages.add(userMessage);

    isTyping.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    isTyping.value = false;

    final response = _generateMockResponse(content);
    final assistantMessage = ChatMessageModel.assistant(
      id: 'assistant-${DateTime.now().millisecondsSinceEpoch}',
      content: response,
      timestamp: DateTime.now(),
      modelUsed: 'mock-model',
      tokensUsed: response.length,
    );

    messages.add(assistantMessage);
  }

  String _generateMockResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();

    if (lowerMessage.contains('ola') || lowerMessage.contains('oi')) {
      return 'Ola! Como posso ajuda-lo hoje?';
    }

    if (lowerMessage.contains('preco') || lowerMessage.contains('valor')) {
      return 'Para consultar precos de produtos, por favor informe o nome '
          'ou codigo do medicamento que voce esta procurando.';
    }

    if (lowerMessage.contains('estoque')) {
      return 'Posso verificar o estoque de produtos para voce. '
          'Qual produto voce gostaria de consultar?';
    }

    return 'Entendi sua mensagem: "$userMessage"\n\n'
        'Esta e uma resposta simulada do ambiente de demonstracao.';
  }
}

class _MockChatProvider extends ChatProvider {
  _MockChatProvider() : super(channelFactory: _mockChannelFactory);

  static Future<Never> _mockChannelFactory() async {
    throw UnimplementedError('Mock provider does not use real gRPC channel');
  }
}
