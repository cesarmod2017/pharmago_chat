import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/chat_contact_model.dart';
import '../models/chat_message_model.dart';
import '../providers/chat_provider.dart';

/// Estados de conexão para o chat gRPC
enum ChatConnectionState {
  connected,
  connecting,
  disconnected,
  reconnecting,
}

class ChatController extends GetxController {
  final ChatProvider provider;
  final String userName;
  final String userEmail;
  final String client;
  final String agentName;
  final String? erpName;
  final String language;
  final String type;
  final Map<String, String>? metadata;
  final bool useStreaming;
  final String? preferredModel;

  ChatController({
    required this.provider,
    required this.userName,
    required this.userEmail,
    required this.client,
    required this.agentName,
    this.erpName,
    this.language = 'pt-BR',
    required this.type,
    this.metadata,
    this.useStreaming = true,
    this.preferredModel,
  });

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode messageFocusNode = FocusNode();

  final messages = <ChatMessageModel>[].obs;
  final isLoading = false.obs;
  final isTyping = false.obs;
  final sessionId = ''.obs;
  final error = Rxn<String>();
  final streamingContent = ''.obs;

  final contact = ChatContactModel.defaultBot().obs;
  final isOnline = true.obs;

  /// Estado atual da conexão
  final connectionState = ChatConnectionState.disconnected.obs;

  /// Indica se está em processo de reconexão
  final isReconnecting = false.obs;

  /// Indica se houve falha persistente de conexão
  final hasConnectionError = false.obs;

  StreamSubscription? _streamSubscription;
  Timer? _healthCheckTimer;

  // ============ Variáveis para reconexão com backoff exponencial ============

  /// Intervalos de backoff em segundos: 5s, 15s, 30s, 60s
  static const List<int> _backoffIntervals = [5, 15, 30, 60];

  /// Índice atual no array de intervalos de backoff
  int _currentBackoffIndex = 0;

  /// Contador de erros consecutivos no intervalo atual
  int _consecutiveErrors = 0;

  /// Máximo de erros antes de avançar para o próximo intervalo
  static const int _maxErrorsPerInterval = 5;

  /// Timer para reconexão automática
  Timer? _reconnectTimer;

  /// Indica se reconexão está ativa
  bool _reconnectionActive = false;

  /// Timestamps dos últimos erros para detectar erros em rajada
  final List<DateTime> _errorTimestamps = [];

  /// Contador de tentativas na pausa especial (5 tentativas a cada 5s)
  int _specialPauseAttempts = 0;

  /// Indica se está em modo de pausa especial
  bool _inSpecialPause = false;

  @override
  void onInit() {
    super.onInit();
    _initSession();
    _startHealthCheck();
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    messageFocusNode.dispose();
    _streamSubscription?.cancel();
    _healthCheckTimer?.cancel();
    _reconnectTimer?.cancel();
    _reconnectionActive = false;
    _endSessionSilently();
    super.onClose();
  }

  void setContact(ChatContactModel newContact) {
    contact.value = newContact;
  }

  void _startHealthCheck() {
    _checkHealth();
    _healthCheckTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _checkHealth(),
    );
  }

  Future<void> _checkHealth() async {
    final online = await provider.checkHealth();
    final wasOnline = isOnline.value;

    if (wasOnline != online) {
      isOnline.value = online;
      _updateContactStatus();

      if (!online && wasOnline) {
        // Conexão perdida - iniciar reconexão automática
        _startReconnection();
      } else if (online && !wasOnline) {
        // Conexão restaurada
        _onConnectionRestored();
      }
    }
  }

  // ============ Métodos de reconexão com backoff exponencial ============

  /// Reseta todos os contadores de backoff para valores iniciais
  void _resetBackoff() {
    _currentBackoffIndex = 0;
    _consecutiveErrors = 0;
    _errorTimestamps.clear();
    _specialPauseAttempts = 0;
    _inSpecialPause = false;
  }

  /// Chamado quando a conexão é restaurada com sucesso
  void _onConnectionRestored() {
    _resetBackoff();
    _reconnectTimer?.cancel();
    _reconnectionActive = false;
    isReconnecting.value = false;
    hasConnectionError.value = false;
    connectionState.value = ChatConnectionState.connected;
  }

  /// Inicia o processo de reconexão automática
  void _startReconnection() {
    if (_reconnectionActive) return;

    _reconnectionActive = true;
    isReconnecting.value = true;
    hasConnectionError.value = true;
    connectionState.value = ChatConnectionState.reconnecting;

    _scheduleReconnect();
  }

  /// Agenda a próxima tentativa de reconexão
  void _scheduleReconnect() {
    _reconnectTimer?.cancel();

    if (!_reconnectionActive) return;

    final interval = _getNextInterval();
    _reconnectTimer = Timer(
      Duration(seconds: interval),
      _attemptReconnect,
    );
  }

  /// Calcula o próximo intervalo de reconexão baseado no backoff
  int _getNextInterval() {
    // Se está em pausa especial, usar intervalo de 5 segundos
    if (_inSpecialPause) {
      return 5;
    }

    // Verificar se houve 5 erros em 60 segundos (ativar pausa especial)
    _cleanOldErrorTimestamps();
    if (_errorTimestamps.length >= 5) {
      _inSpecialPause = true;
      _specialPauseAttempts = 0;
      return 5;
    }

    return _backoffIntervals[_currentBackoffIndex];
  }

  /// Remove timestamps de erros mais antigos que 60 segundos
  void _cleanOldErrorTimestamps() {
    final cutoff = DateTime.now().subtract(const Duration(seconds: 60));
    _errorTimestamps.removeWhere((ts) => ts.isBefore(cutoff));
  }

  /// Tenta reconectar ao servidor gRPC
  Future<void> _attemptReconnect() async {
    if (!_reconnectionActive) return;

    connectionState.value = ChatConnectionState.connecting;

    try {
      // Resetar o cliente gRPC para forçar nova conexão
      provider.resetClient();

      final online = await provider.checkHealth();

      if (online) {
        // Conexão restaurada com sucesso
        isOnline.value = true;
        _updateContactStatus();
        _onConnectionRestored();

        // Reinicializar sessão se necessário
        if (sessionId.value.isEmpty) {
          await _initSession();
        }
        return;
      }

      // Conexão falhou - registrar erro
      _onReconnectError();
    } catch (e) {
      _onReconnectError();
    }
  }

  /// Chamado quando uma tentativa de reconexão falha
  void _onReconnectError() {
    _errorTimestamps.add(DateTime.now());
    _consecutiveErrors++;

    if (_inSpecialPause) {
      _specialPauseAttempts++;
      if (_specialPauseAttempts >= 5) {
        // Pausa especial concluída, voltar ao backoff normal
        _inSpecialPause = false;
        _specialPauseAttempts = 0;
        // Avançar para o próximo intervalo após a pausa especial
        if (_currentBackoffIndex < _backoffIntervals.length - 1) {
          _currentBackoffIndex++;
        }
        _consecutiveErrors = 0;
      }
    } else if (_consecutiveErrors >= _maxErrorsPerInterval) {
      // Avançar para o próximo intervalo de backoff
      _consecutiveErrors = 0;
      if (_currentBackoffIndex < _backoffIntervals.length - 1) {
        _currentBackoffIndex++;
      }
    }

    connectionState.value = ChatConnectionState.reconnecting;
    _scheduleReconnect();
  }

  /// Força uma tentativa imediata de reconexão (chamado pelo usuário)
  Future<bool> forceReconnect() async {
    _reconnectTimer?.cancel();
    isReconnecting.value = true;
    connectionState.value = ChatConnectionState.connecting;

    try {
      provider.resetClient();
      final online = await provider.checkHealth();

      if (online) {
        isOnline.value = true;
        _updateContactStatus();
        _onConnectionRestored();

        // Reinicializar sessão se necessário
        if (sessionId.value.isEmpty) {
          await _initSession();
        }
        return true;
      }

      // Falha na reconexão forçada
      _onReconnectError();
      return false;
    } catch (e) {
      _onReconnectError();
      return false;
    }
  }

  /// Verifica e tenta reconectar se necessário (para uso ao abrir a tela)
  Future<void> ensureConnected() async {
    if (!isOnline.value || hasConnectionError.value) {
      await forceReconnect();
    } else {
      // Verificar saúde da conexão
      final online = await provider.checkHealth();
      if (!online) {
        await forceReconnect();
      }
    }
  }

  /// Retorna o intervalo atual de reconexão em segundos
  int get currentReconnectInterval {
    if (_inSpecialPause) return 5;
    return _backoffIntervals[_currentBackoffIndex];
  }

  /// Para a reconexão automática
  void stopReconnection() {
    _reconnectTimer?.cancel();
    _reconnectionActive = false;
    isReconnecting.value = false;
  }

  void _updateContactStatus() {
    final statusText = isOnline.value ? 'chat_online'.tr : 'chat_offline'.tr;
    contact.value = contact.value.copyWith(
      subtitle: statusText,
      isOnline: isOnline.value,
    );
  }

  Future<void> _initSession() async {
    isLoading.value = true;
    error.value = null;
    connectionState.value = ChatConnectionState.connecting;

    try {
      // Load existing history by email from Redis (180 days TTL)
      await _loadHistoryByEmail();

      final response = await provider.createSession(
        name: userName,
        email: userEmail,
        client: client,
        agentName: agentName,
        erpName: erpName,
        language: language,
        type: type,
        metadata: metadata,
      );

      sessionId.value = response.sessionId;
      isOnline.value = true;
      hasConnectionError.value = false;
      connectionState.value = ChatConnectionState.connected;
      _updateContactStatus();
      _resetBackoff();

      // Only show welcome message if no history was loaded
      if (response.welcomeMessage.isNotEmpty && messages.isEmpty) {
        final welcomeMessage = ChatMessageModel.assistant(
          id: const Uuid().v4(),
          content: response.welcomeMessage,
          timestamp: response.hasCreatedAt()
              ? response.createdAt.toDateTime()
              : DateTime.now(),
        );
        messages.add(welcomeMessage);
      }
    } catch (e) {
      error.value = 'chat_error_init_session'.tr;
      isOnline.value = false;
      hasConnectionError.value = true;
      connectionState.value = ChatConnectionState.disconnected;
      _updateContactStatus();
      // Não adicionar mensagem de erro - a UI mostrará a tela de erro
      // Iniciar reconexão automática
      _startReconnection();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadHistoryByEmail() async {
    try {
      final response = await provider.getHistoryByEmail(
        userEmail: userEmail,
        limit: 10,
      );

      if (response.messages.isNotEmpty) {
        messages.clear();
        for (final proto in response.messages) {
          messages.add(ChatMessageModel.fromHistoryProto(proto));
        }
        _scrollToBottom();
      }
    } catch (e) {
      // Silently ignore errors when loading history
      // The chat will start fresh if history cannot be loaded
    }
  }

  Future<void> sendMessage() async {
    final content = messageController.text.trim();
    if (content.isEmpty || sessionId.value.isEmpty) return;

    messageController.clear();
    error.value = null;

    final userMessageId = const Uuid().v4();
    final userMessage = ChatMessageModel.user(
      id: userMessageId,
      content: content,
      status: MessageStatus.sending,
    );

    messages.add(userMessage);
    _scrollToBottom();

    try {
      _updateMessageStatus(userMessageId, MessageStatus.sent);

      if (useStreaming) {
        await _sendWithStreaming(content);
      } else {
        await _sendWithoutStreaming(content);
      }
    } catch (e) {
      _updateMessageStatus(userMessageId, MessageStatus.error);
      _addErrorMessage('chat_error_send_message'.tr);
    }
  }

  Future<void> _sendWithStreaming(String content) async {
    isTyping.value = true;
    streamingContent.value = '';

    final assistantMessageId = const Uuid().v4();
    final tempMessage = ChatMessageModel.assistant(
      id: assistantMessageId,
      content: '',
    );
    messages.add(tempMessage);
    _scrollToBottom();

    try {
      String? modelUsed;
      int? tokensUsed;
      List<String>? sources;

      await for (final chunk in provider.sendMessageStream(
        sessionId: sessionId.value,
        message: content,
        preferredModel: preferredModel,
      )) {
        streamingContent.value += chunk.content;

        final index = messages.indexWhere((m) => m.id == assistantMessageId);
        if (index != -1) {
          messages[index] = messages[index].copyWith(
            content: streamingContent.value,
          );
        }
        _scrollToBottom();

        if (chunk.isFinal) {
          modelUsed = chunk.modelUsed;
          tokensUsed = chunk.tokensUsed;
          sources = chunk.sources.isNotEmpty ? chunk.sources : null;
        }
      }

      final index = messages.indexWhere((m) => m.id == assistantMessageId);
      if (index != -1) {
        messages[index] = messages[index].copyWith(
          modelUsed: modelUsed,
          tokensUsed: tokensUsed,
          sources: sources,
        );
      }
    } finally {
      isTyping.value = false;
      streamingContent.value = '';
    }
  }

  Future<void> _sendWithoutStreaming(String content) async {
    isTyping.value = true;

    try {
      final response = await provider.sendMessage(
        sessionId: sessionId.value,
        message: content,
        preferredModel: preferredModel,
      );

      final assistantMessage = ChatMessageModel.assistant(
        id: response.messageId,
        content: response.response,
        timestamp: response.hasTimestamp()
            ? response.timestamp.toDateTime()
            : DateTime.now(),
        modelUsed: response.modelUsed,
        tokensUsed: response.tokensUsed,
        sources: response.sources.isNotEmpty ? response.sources : null,
      );

      messages.add(assistantMessage);
      _scrollToBottom();
    } finally {
      isTyping.value = false;
    }
  }

  Future<void> loadHistory() async {
    if (sessionId.value.isEmpty) return;

    isLoading.value = true;
    try {
      final response = await provider.getHistory(sessionId: sessionId.value);

      messages.clear();
      for (final proto in response.messages) {
        messages.add(ChatMessageModel.fromProto(proto));
      }
      _scrollToBottom();
    } catch (e) {
      error.value = 'chat_error_load_history'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> retryLastMessage() async {
    if (messages.isEmpty) return;

    ChatMessageModel? lastUserMessage;
    for (int i = messages.length - 1; i >= 0; i--) {
      if (messages[i].isUser) {
        lastUserMessage = messages[i];
        break;
      }
    }

    if (lastUserMessage == null || !lastUserMessage.hasError) return;

    messages.removeWhere((m) => m.id == lastUserMessage!.id);
    messageController.text = lastUserMessage.content;
    await sendMessage();
  }

  void _updateMessageStatus(String messageId, MessageStatus status) {
    final index = messages.indexWhere((m) => m.id == messageId);
    if (index != -1) {
      messages[index] = messages[index].copyWith(status: status);
    }
  }

  void _addErrorMessage(String errorText) {
    final errorMessage = ChatMessageModel.assistant(
      id: const Uuid().v4(),
      content: errorText,
    );
    messages.add(errorMessage);
    _scrollToBottom();
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

  Future<void> _endSessionSilently() async {
    if (sessionId.value.isEmpty) return;

    try {
      await provider.endSession(sessionId: sessionId.value);
    } catch (_) {
      // Silently ignore errors when ending session
    }
  }

  void clearMessages() {
    messages.clear();
  }

  bool get canSend =>
      !isLoading.value &&
      !isTyping.value &&
      messageController.text.trim().isNotEmpty;
}
