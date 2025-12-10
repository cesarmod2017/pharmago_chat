import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/support_controller.dart';
import '../models/support_models.dart';

class SupportDashboardPage extends GetView<SupportController> {
  const SupportDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('support_dashboard'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshPendingTransfers,
            tooltip: 'support_refresh'.tr,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshPendingTransfers,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() => _buildQueueStatusCard()),
              const SizedBox(height: 24),
              _buildSectionTitle('support_pending_transfers'.tr),
              const SizedBox(height: 8),
              Obx(() => _buildTransfersList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQueueStatusCard() {
    final status = controller.queueStatus.value;
    if (status == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusItem(
                  icon: Icons.pending_actions,
                  label: 'support_pending_transfers'.tr,
                  value: status.pendingTransfers.toString(),
                  color: Colors.orange,
                ),
                _buildStatusItem(
                  icon: Icons.chat,
                  label: 'support_active_sessions'.tr,
                  value: status.activeSupportSessions.toString(),
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusItem(
                  icon: Icons.support_agent,
                  label: 'support_available_operators'.tr,
                  value: status.availableOperators.toString(),
                  color: Colors.green,
                ),
                _buildStatusItem(
                  icon: Icons.timer,
                  label: 'support_average_wait'.tr,
                  value: status.averageWaitTimeFormatted,
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTransfersList() {
    if (controller.isLoading.value && controller.pendingTransfers.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (controller.pendingTransfers.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                const Icon(Icons.check_circle_outline,
                    size: 48, color: Colors.green),
                const SizedBox(height: 16),
                Text(
                  'support_no_transfers'.tr,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.pendingTransfers.length,
      itemBuilder: (context, index) {
        final transfer = controller.pendingTransfers[index];
        return SupportTransferCard(
          transfer: transfer,
          onAccept: () => _acceptTransfer(transfer),
        );
      },
    );
  }

  Future<void> _acceptTransfer(SupportTransferModel transfer) async {
    final success = await controller.acceptTransfer(transfer);
    if (success) {
      Get.toNamed('/support/session');
    }
  }
}

class SupportTransferCard extends StatelessWidget {
  final SupportTransferModel transfer;
  final VoidCallback? onAccept;

  const SupportTransferCard({
    super.key,
    required this.transfer,
    this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: _getPriorityColor(transfer.priority),
                  child: Text(
                    transfer.userName.isNotEmpty
                        ? transfer.userName[0].toUpperCase()
                        : '?',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transfer.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        transfer.userEmail,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(transfer.priorityLabel),
                  backgroundColor: _getPriorityColor(transfer.priority)
                      .withValues(alpha: 0.2),
                  labelStyle: TextStyle(
                    color: _getPriorityColor(transfer.priority),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '${'support_reason'.tr}: ${transfer.reason}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            if (transfer.lastMessage.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  transfer.lastMessage,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${'support_wait_time'.tr}: ${transfer.waitTimeFormatted}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                ElevatedButton.icon(
                  onPressed: onAccept,
                  icon: const Icon(Icons.check),
                  label: Text('support_accept'.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 5:
        return Colors.red;
      case 4:
        return Colors.orange;
      case 3:
        return Colors.blue;
      case 2:
        return Colors.grey;
      case 1:
        return Colors.grey.shade400;
      default:
        return Colors.blue;
    }
  }
}

class SupportQueuePage extends GetView<SupportController> {
  const SupportQueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('support_queue'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshPendingTransfers,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.pendingTransfers.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.pendingTransfers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle_outline,
                    size: 64, color: Colors.green),
                const SizedBox(height: 16),
                Text(
                  'support_no_transfers'.tr,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshPendingTransfers,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.pendingTransfers.length,
            itemBuilder: (context, index) {
              final transfer = controller.pendingTransfers[index];
              return SupportTransferCard(
                transfer: transfer,
                onAccept: () async {
                  final success = await controller.acceptTransfer(transfer);
                  if (success) {
                    Get.toNamed('/support/session');
                  }
                },
              );
            },
          ),
        );
      }),
    );
  }
}

class SupportSessionPage extends GetView<SupportController> {
  const SupportSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('support_title'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => _showChatHistory(context),
            tooltip: 'support_chat_history'.tr,
          ),
          PopupMenuButton<String>(
            onSelected: (value) => _handleEndSession(context, value),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'resolved',
                child: Text('support_resolve'.tr),
              ),
              PopupMenuItem(
                value: 'returned_to_bot',
                child: Text('support_return_to_bot'.tr),
              ),
              PopupMenuItem(
                value: 'closed',
                child: Text('support_close'.tr),
              ),
            ],
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return SupportMessageBubble(message: message);
                  },
                )),
          ),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.messageController,
              decoration: InputDecoration(
                hintText: 'support_message_placeholder'.tr,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (_) => controller.sendMessage(),
            ),
          ),
          const SizedBox(width: 12),
          Obx(() => IconButton.filled(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.sendMessage,
                icon: const Icon(Icons.send),
              )),
        ],
      ),
    );
  }

  void _showChatHistory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.history),
                  const SizedBox(width: 8),
                  Text(
                    'support_chat_history'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: Obx(() => ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.chatHistory.length,
                    itemBuilder: (context, index) {
                      final message = controller.chatHistory[index];
                      return _buildHistoryMessage(message);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryMessage(SupportChatHistoryModel message) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isUser ? 'Cliente' : 'Bot',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: isUser ? Colors.blue.shade700 : Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 4),
            Text(message.content),
          ],
        ),
      ),
    );
  }

  void _handleEndSession(BuildContext context, String resolution) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('support_end_session'.tr),
        content: Text('support_confirm_end'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('support_cancel'.tr),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await controller.endSupportSession(
                resolution: resolution,
              );
              if (success) {
                Get.back();
                Get.snackbar(
                  'support_title'.tr,
                  'support_session_ended'.tr,
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('support_end_session'.tr),
          ),
        ],
      ),
    );
  }
}

class SupportMessageBubble extends StatelessWidget {
  final SupportMessageModel message;

  const SupportMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.isSystemMessage) {
      return _buildSystemMessage(context);
    }

    final isFromOperator = message.isFromOperator;
    return Align(
      alignment: isFromOperator ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: isFromOperator
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isFromOperator ? 16 : 4),
            bottomRight: Radius.circular(isFromOperator ? 4 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.senderName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: isFromOperator ? Colors.white70 : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.content,
              style: TextStyle(
                color: isFromOperator ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                fontSize: 10,
                color: isFromOperator ? Colors.white54 : Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemMessage(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message.content,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
