import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';

/// Chat content widget for admin layout
class ChatContent extends StatefulWidget {
  const ChatContent({super.key});

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  ChatController? _controller;
  ChatProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const String _tag = 'admin_chat';

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    try {
      _provider = ChatProvider(channelFactory: ChatEnvironment.channelFactory);
      _controller = ChatController(
        provider: _provider!,
        userName: 'Administrador',
        userEmail: 'admin@pharmago.com.br',
        useStreaming: true,
        client: 'farmago',
        agentName: 'Assistente PharmaGO',
        erpName: null,
        language: 'pt-BR',
        type: 'farmago',
        metadata: {
          'source': 'admin_panel',
          'platform': defaultTargetPlatform.name,
        },
      );

      Get.put<ChatController>(_controller!, tag: _tag);

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
    Get.delete<ChatController>(tag: _tag);
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return _buildErrorState();
    }

    if (!_isInitialized) {
      return _buildLoadingState();
    }

    return _buildChatContent();
  }

  Widget _buildErrorState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: colorScheme.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Erro ao inicializar o chat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _initError!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  _initError = null;
                });
                _initializeChat();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Conectando ao servidor...',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatContent() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: ChatPageWidget(
        controller: _controller!,
        contact: ChatContactModel(
          name: 'Assistente PharmaGO',
          subtitle: '${ChatEnvironment.host}:${ChatEnvironment.port}',
          isOnline: true,
        ),
        showAppBar: false,
        headerActions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller!.clearMessages(),
            tooltip: 'Reiniciar chat',
          ),
        ],
        inputHintText: 'Digite sua mensagem...',
        sendOnEnter: true,
      ),
    );
  }
}
