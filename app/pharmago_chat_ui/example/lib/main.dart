import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';

/// ============================================================================
/// Configuração do Modo de Operação
/// ============================================================================
///
/// Altere esta constante para controlar o comportamento do aplicativo:
/// - `true`: Usa modo de DEMONSTRAÇÃO com respostas simuladas (offline)
/// - `false`: Usa conexão REAL com o servidor gRPC (requer backend rodando)
///
/// Em modo DEBUG, o padrão é usar demonstração para facilitar testes de UI.
/// Em modo RELEASE, força conexão real com o servidor de produção.
const bool _useDemoMode = false;

void main() {
  // Opcional: Configurar endpoint personalizado antes de iniciar
  // ChatEnvironment.configure(
  //   host: 'localhost',
  //   port: 5144,
  //   useTls: false,
  // );

  // Ou definir URL de produção:
  // ChatEnvironment.setReleaseHost('chat.suaempresa.com.br');

  debugPrint('[CHAT] Environment: ${ChatEnvironment.description}');
  debugPrint('[CHAT] Demo Mode: $_useDemoMode');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat Module Test',
      debugShowCheckedModeBanner: false,
      translations: _ChatExampleTranslations(),
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const ChatTestPage(),
    );
  }
}

class _ChatExampleTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => ChatTranslations.translations;
}

class ChatTestPage extends StatefulWidget {
  const ChatTestPage({super.key});

  @override
  State<ChatTestPage> createState() => _ChatTestPageState();
}

class _ChatTestPageState extends State<ChatTestPage> {
  ChatController? _controller;
  ChatProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    try {
      if (_useDemoMode) {
        // Modo demonstração: usa MockChatController
        _controller = MockChatController();
      } else {
        // Modo real: usa ChatController com gRPC
        _provider = ChatProvider(
          channelFactory: ChatEnvironment.channelFactory,
        );
        _controller = ChatController(
          provider: _provider!,
          userName: 'Usuário Teste',
          userEmail: 'teste@pharmago.com.br',
          useStreaming: true, // Habilita streaming para respostas em tempo real
          metadata: {
            'source': 'example_app',
            'platform': defaultTargetPlatform.name,
          },
        );
      }

      Get.put<ChatController>(_controller!);

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
    Get.delete<ChatController>();
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return Scaffold(
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
      return const Scaffold(
        body: Center(
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

    final modeLabel = _useDemoMode ? 'Modo Demo' : 'Conectado';
    final modeSubtitle = _useDemoMode
        ? 'Online - Modo Demo'
        : 'Online - ${ChatEnvironment.host}:${ChatEnvironment.port}';

    return Scaffold(
      body: SafeArea(
        child: ChatPageWidget(
          controller: _controller!,
          contact: ChatContactModel(
            name: 'Assistente PharmaGO',
            subtitle: modeSubtitle,
            isOnline: true,
          ),
          onBackPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Voltar pressionado ($modeLabel)'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          headerActions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _controller!.clearMessages();
                if (_controller is MockChatController) {
                  (_controller as MockChatController).addWelcomeMessage();
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Chat reiniciado'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              tooltip: 'Reiniciar chat',
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => _showInfoDialog(context),
              tooltip: 'Informações',
            ),
          ],
          emptyWidget: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Envie uma mensagem para começar',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          inputHintText: 'Digite sua mensagem...',
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    final connectionInfo = _useDemoMode
        ? 'Modo: DEMONSTRAÇÃO (respostas simuladas)'
        : 'Modo: PRODUÇÃO\nServidor: ${ChatEnvironment.host}:${ChatEnvironment.port}\nTLS: ${ChatEnvironment.useTls ? "Sim" : "Não"}';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chat Module Test'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Este é o módulo de chat PharmaGO.'),
            const SizedBox(height: 12),
            const Text('Funcionalidades:'),
            const Text('• Envio de mensagens'),
            const Text('• Respostas via IA (Claude/GPT)'),
            const Text('• Streaming em tempo real'),
            const Text('• Indicador de digitação'),
            const Text('• Tema claro/escuro'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                connectionInfo,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 11),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _useDemoMode
                  ? 'Para usar conexão real, defina _useDemoMode = false no main.dart'
                  : 'Conectado ao servidor gRPC real.',
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Mock Classes para Modo Demonstração
// ============================================================================

/// Mock ChatController for testing the chat UI without a real gRPC connection.
/// Este controller simula respostas localmente sem necessidade de backend.
class MockChatController extends ChatController {
  MockChatController()
    : super(
        provider: MockChatProvider(),
        userName: 'Test User',
        userEmail: 'test@example.com',
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
          'Olá! Sou o assistente PharmaGO em modo de demonstração. '
          'Como posso ajudá-lo hoje?\n\n'
          '_Este é um ambiente de teste - as respostas são simuladas._',
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
    _scrollToBottom();

    // Simulate typing delay
    isTyping.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    isTyping.value = false;

    // Generate mock response
    final response = _generateMockResponse(content);
    final assistantMessage = ChatMessageModel.assistant(
      id: 'assistant-${DateTime.now().millisecondsSinceEpoch}',
      content: response,
      timestamp: DateTime.now(),
      modelUsed: 'mock-model',
      tokensUsed: response.length,
    );

    messages.add(assistantMessage);
    _scrollToBottom();
  }

  String _generateMockResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();

    if (lowerMessage.contains('olá') ||
        lowerMessage.contains('oi') ||
        lowerMessage.contains('bom dia') ||
        lowerMessage.contains('boa tarde') ||
        lowerMessage.contains('boa noite')) {
      return 'Olá! Como posso ajudá-lo hoje?';
    }

    if (lowerMessage.contains('preço') || lowerMessage.contains('valor')) {
      return 'Para consultar preços de produtos, por favor informe o nome '
          'ou código do medicamento que você está procurando.';
    }

    if (lowerMessage.contains('estoque')) {
      return 'Posso verificar o estoque de produtos para você. '
          'Qual produto você gostaria de consultar?';
    }

    if (lowerMessage.contains('ajuda') || lowerMessage.contains('help')) {
      return 'Estou aqui para ajudar! Posso auxiliar com:\n'
          '• Consulta de preços\n'
          '• Verificação de estoque\n'
          '• Informações sobre produtos\n'
          '• Dúvidas gerais\n\n'
          'O que você precisa?';
    }

    if (lowerMessage.contains('obrigado') || lowerMessage.contains('valeu')) {
      return 'Por nada! Estou sempre à disposição. '
          'Se precisar de mais alguma coisa, é só perguntar.';
    }

    return 'Entendi sua mensagem: "$userMessage"\n\n'
        'Esta é uma resposta simulada do ambiente de demonstração. '
        'Em um ambiente real, você receberia uma resposta baseada em '
        'inteligência artificial integrada ao sistema PharmaGO.';
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

/// Mock ChatProvider that doesn't make real gRPC calls.
/// Usado apenas no modo demonstração.
class MockChatProvider extends ChatProvider {
  MockChatProvider() : super(channelFactory: _mockChannelFactory);

  static Future<Never> _mockChannelFactory() async {
    throw UnimplementedError('Mock provider does not use real gRPC channel');
  }
}
