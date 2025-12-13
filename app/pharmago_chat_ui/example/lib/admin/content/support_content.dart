import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/support/support_module.dart';

/// Support content widget for admin layout
class SupportContent extends StatefulWidget {
  const SupportContent({super.key});

  @override
  State<SupportContent> createState() => _SupportContentState();
}

class _SupportContentState extends State<SupportContent> {
  SupportController? _controller;
  SupportProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const String _tag = 'admin_support';

  @override
  void initState() {
    super.initState();
    _initializeSupport();
  }

  Future<void> _initializeSupport() async {
    try {
      _provider = SupportProvider(
        channelFactory: SupportEnvironment.channelFactory,
      );
      _controller = SupportController(
        provider: _provider!,
        operatorId: 'operator-admin',
        operatorName: 'Administrador',
      );

      Get.put<SupportController>(_controller!, tag: _tag);

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
    Get.delete<SupportController>(tag: _tag);
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

    return _buildSupportContent();
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
              'Erro ao inicializar o suporte',
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
                _initializeSupport();
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
            'Conectando ao servidor de suporte...',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportContent() {
    return Obx(() {
      if (_controller!.isInSupportSession.value) {
        return _buildSupportSession();
      }
      return _buildSupportDashboard();
    });
  }

  Widget _buildSupportDashboard() {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return RefreshIndicator(
      onRefresh: _controller!.refreshPendingTransfers,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildQueueStatusCards(),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: isDark ? colorScheme.surface : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          'support_pending_transfers'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        IconButton.outlined(
                          onPressed: _controller!.refreshPendingTransfers,
                          icon: const Icon(Icons.refresh, size: 20),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.1),
                  ),
                  _buildTransfersList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQueueStatusCards() {
    return Obx(() {
      final status = _controller!.queueStatus.value;
      if (status == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return Row(
        children: [
          Expanded(
            child: _buildStatusCard(
              icon: Icons.pending_actions,
              label: 'Pendentes',
              value: status.pendingTransfers.toString(),
              color: Colors.orange,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatusCard(
              icon: Icons.chat_bubble_outline,
              label: 'Ativos',
              value: status.activeSupportSessions.toString(),
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatusCard(
              icon: Icons.support_agent,
              label: 'Operadores',
              value: status.availableOperators.toString(),
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatusCard(
              icon: Icons.timer_outlined,
              label: 'Tempo Medio',
              value: status.averageWaitTimeFormatted,
              color: Colors.purple,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildStatusCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransfersList() {
    return Obx(() {
      if (_controller!.isLoading.value && _controller!.pendingTransfers.isEmpty) {
        return const Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: CircularProgressIndicator()),
        );
      }

      if (_controller!.pendingTransfers.isEmpty) {
        return _buildEmptyTransfersState();
      }

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _controller!.pendingTransfers.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
        ),
        itemBuilder: (context, index) {
          final transfer = _controller!.pendingTransfers[index];
          return _buildTransferTile(transfer);
        },
      );
    });
  }

  Widget _buildEmptyTransfersState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(48),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 32,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'support_no_transfers'.tr,
              style: TextStyle(
                fontSize: 15,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferTile(SupportTransferModel transfer) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => _acceptTransfer(transfer),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getPriorityColor(transfer.priority).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'P${transfer.priority}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: _getPriorityColor(transfer.priority),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transfer.userName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transfer.reason,
                    style: TextStyle(
                      fontSize: 13,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  if (transfer.lastMessage.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      '"${transfer.lastMessage}"',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _formatWaitTime(transfer.waitTimeSeconds),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () => _acceptTransfer(transfer),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text('Aceitar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportSession() {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : Colors.white,
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
      child: Column(
        children: [
          _buildSessionHeader(),
          Expanded(child: _buildMessagesList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildSessionHeader() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.person,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sessao de Suporte',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'support_title'.tr,
                  style: TextStyle(
                    fontSize: 13,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          IconButton.outlined(
            onPressed: () => _showChatHistory(),
            icon: const Icon(Icons.history, size: 20),
            tooltip: 'support_chat_history'.tr,
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            onSelected: (value) => _handleEndSession(value),
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.close,
                    size: 18,
                    color: colorScheme.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Encerrar',
                    style: TextStyle(
                      color: colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return Obx(() => ListView.builder(
          controller: _controller!.scrollController,
          padding: const EdgeInsets.all(16),
          itemCount: _controller!.messages.length,
          itemBuilder: (context, index) {
            final message = _controller!.messages[index];
            return SupportMessageBubble(message: message);
          },
        ));
  }

  Widget _buildMessageInput() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller!.messageController,
              decoration: InputDecoration(
                hintText: 'support_message_placeholder'.tr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (_) => _controller!.sendMessage(),
            ),
          ),
          const SizedBox(width: 12),
          Obx(() => FilledButton(
                onPressed: _controller!.isLoading.value
                    ? null
                    : _controller!.sendMessage,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Icon(Icons.send, size: 20),
              )),
        ],
      ),
    );
  }

  Color _getPriorityColor(int priority) {
    if (priority >= 4) return Colors.red;
    if (priority >= 3) return Colors.orange;
    if (priority >= 2) return Colors.yellow.shade700;
    return Colors.green;
  }

  String _formatWaitTime(int seconds) {
    if (seconds < 60) return '${seconds}s';
    final minutes = seconds ~/ 60;
    if (minutes < 60) return '${minutes}m';
    final hours = minutes ~/ 60;
    return '${hours}h ${minutes % 60}m';
  }

  Future<void> _acceptTransfer(SupportTransferModel transfer) async {
    final success = await _controller!.acceptTransfer(transfer);
    if (!success && mounted) {
      Get.snackbar(
        'Erro',
        'Nao foi possivel aceitar a transferencia',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _showChatHistory() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
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
                    itemCount: _controller!.chatHistory.length,
                    itemBuilder: (context, index) {
                      final message = _controller!.chatHistory[index];
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

  void _handleEndSession(String resolution) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('support_end_session'.tr),
        content: Text('support_confirm_end'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('support_cancel'.tr),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              final success = await _controller!.endSupportSession(
                resolution: resolution,
              );
              if (success && mounted) {
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
