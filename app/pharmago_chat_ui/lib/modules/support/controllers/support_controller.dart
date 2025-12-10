import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/support_models.dart';
import '../providers/support_provider.dart';

class SupportController extends GetxController {
  final SupportProvider provider;
  final String? operatorId;
  final String? operatorName;

  SupportController({
    required this.provider,
    this.operatorId,
    this.operatorName,
  });

  final pendingTransfers = <SupportTransferModel>[].obs;
  final messages = <SupportMessageModel>[].obs;
  final queueStatus = Rxn<QueueStatusModel>();
  final chatHistory = <SupportChatHistoryModel>[].obs;

  final isLoading = false.obs;
  final error = Rxn<String>();

  final currentSessionId = ''.obs;
  final currentTransferId = ''.obs;
  final isInSupportSession = false.obs;

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  StreamSubscription? _messageStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    loadQueueStatus();
    loadPendingTransfers();
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    _messageStreamSubscription?.cancel();
    super.onClose();
  }

  Future<void> loadQueueStatus() async {
    try {
      final response = await provider.getQueueStatus();
      queueStatus.value = QueueStatusModel.fromProto(response);
    } catch (e) {
      error.value = 'support_error_load_queue'.tr;
    }
  }

  Future<void> loadPendingTransfers({int limit = 20, int offset = 0}) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.listPendingTransfers(
        limit: limit,
        offset: offset,
      );

      if (offset == 0) {
        pendingTransfers.clear();
      }

      for (final proto in response.transfers) {
        pendingTransfers.add(SupportTransferModel.fromProto(proto));
      }
    } catch (e) {
      error.value = 'support_error_load_transfers'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshPendingTransfers() async {
    await loadPendingTransfers();
    await loadQueueStatus();
  }

  Future<bool> requestTransfer({
    required String sessionId,
    required String reason,
    int priority = 3,
  }) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.requestTransfer(
        sessionId: sessionId,
        reason: reason,
        priority: priority,
      );

      currentTransferId.value = response.transferId;
      return true;
    } catch (e) {
      error.value = 'support_error_request_transfer'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> acceptTransfer(SupportTransferModel transfer) async {
    if (operatorId == null || operatorName == null) {
      error.value = 'support_error_operator_required'.tr;
      return false;
    }

    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.acceptTransfer(
        transferId: transfer.transferId,
        operatorId: operatorId!,
        operatorName: operatorName!,
      );

      if (response.success) {
        currentSessionId.value = response.sessionId;
        isInSupportSession.value = true;

        chatHistory.clear();
        for (final proto in response.history) {
          chatHistory.add(SupportChatHistoryModel.fromProto(proto));
        }

        pendingTransfers.removeWhere(
            (t) => t.transferId == transfer.transferId);

        _startMessageStream();
        return true;
      }
      return false;
    } catch (e) {
      error.value = 'support_error_accept_transfer'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> endSupportSession({
    required String resolution,
    String? notes,
  }) async {
    if (currentSessionId.value.isEmpty || operatorId == null) {
      return false;
    }

    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.endSupportSession(
        sessionId: currentSessionId.value,
        operatorId: operatorId!,
        resolution: resolution,
        notes: notes,
      );

      if (response.success) {
        _stopMessageStream();
        currentSessionId.value = '';
        isInSupportSession.value = false;
        messages.clear();
        chatHistory.clear();
        await refreshPendingTransfers();
        return true;
      }
      return false;
    } catch (e) {
      error.value = 'support_error_end_session'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> sendMessage() async {
    final content = messageController.text.trim();
    if (content.isEmpty || currentSessionId.value.isEmpty) {
      return false;
    }

    messageController.clear();
    error.value = null;

    final tempId = const Uuid().v4();
    final tempMessage = SupportMessageModel(
      messageId: tempId,
      sessionId: currentSessionId.value,
      senderId: operatorId ?? '',
      senderType: operatorId != null ? SenderType.operator : SenderType.client,
      senderName: operatorName ?? 'Cliente',
      content: content,
      timestamp: DateTime.now(),
      messageType: 'text',
    );

    messages.add(tempMessage);
    _scrollToBottom();

    try {
      final response = await provider.sendSupportMessage(
        sessionId: currentSessionId.value,
        senderId: operatorId ?? '',
        senderType: operatorId != null ? 'operator' : 'client',
        message: content,
      );

      final index = messages.indexWhere((m) => m.messageId == tempId);
      if (index != -1) {
        messages[index] = SupportMessageModel(
          messageId: response.messageId,
          sessionId: currentSessionId.value,
          senderId: operatorId ?? '',
          senderType:
              operatorId != null ? SenderType.operator : SenderType.client,
          senderName: operatorName ?? 'Cliente',
          content: content,
          timestamp: response.hasTimestamp()
              ? response.timestamp.toDateTime()
              : DateTime.now(),
          messageType: 'text',
        );
      }

      return response.delivered;
    } catch (e) {
      error.value = 'support_error_send_message'.tr;
      return false;
    }
  }

  void _startMessageStream() {
    if (currentSessionId.value.isEmpty) return;

    _messageStreamSubscription?.cancel();
    _messageStreamSubscription = provider
        .streamSupportMessages(
          sessionId: currentSessionId.value,
          subscriberId: operatorId ?? currentSessionId.value,
        )
        .listen(
          (proto) {
            final message = SupportMessageModel.fromProto(proto);
            if (!messages.any((m) => m.messageId == message.messageId)) {
              messages.add(message);
              _scrollToBottom();
            }
          },
          onError: (e) {
            error.value = 'support_error_stream'.tr;
          },
        );
  }

  void _stopMessageStream() {
    _messageStreamSubscription?.cancel();
    _messageStreamSubscription = null;
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

  void clearError() {
    error.value = null;
  }
}
