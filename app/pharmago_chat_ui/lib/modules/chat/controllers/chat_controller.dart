import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/chat_contact_model.dart';
import '../models/chat_message_model.dart';
import '../providers/chat_provider.dart';

class ChatController extends GetxController {
  final ChatProvider provider;
  final String userName;
  final String userEmail;
  final Map<String, String>? metadata;
  final bool useStreaming;
  final String? preferredModel;

  ChatController({
    required this.provider,
    required this.userName,
    required this.userEmail,
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

  StreamSubscription? _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _initSession();
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    messageFocusNode.dispose();
    _streamSubscription?.cancel();
    _endSessionSilently();
    super.onClose();
  }

  void setContact(ChatContactModel newContact) {
    contact.value = newContact;
  }

  Future<void> _initSession() async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.createSession(
        name: userName,
        email: userEmail,
        metadata: metadata,
      );

      sessionId.value = response.sessionId;

      if (response.welcomeMessage.isNotEmpty) {
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
      _addErrorMessage('chat_error_connection'.tr);
    } finally {
      isLoading.value = false;
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
