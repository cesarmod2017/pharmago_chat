import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/support/support_module.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  SupportController? _controller;
  SupportProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const bool _useDemoMode = false;

  @override
  void initState() {
    super.initState();
    _initializeSupport();
  }

  Future<void> _initializeSupport() async {
    try {
      if (_useDemoMode) {
        _controller = _MockSupportController();
      } else {
        _provider = SupportProvider(
          channelFactory: SupportEnvironment.channelFactory,
        );
        _controller = SupportController(
          provider: _provider!,
          operatorId: 'operator-demo',
          operatorName: 'Operador Demo',
        );
      }

      Get.put<SupportController>(_controller!, tag: 'support_page');

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
    Get.delete<SupportController>(tag: 'support_page');
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Suporte'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Erro ao inicializar o suporte',
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
                    _initializeSupport();
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
        appBar: AppBar(
          title: const Text('Suporte'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Conectando ao servidor de suporte...'),
            ],
          ),
        ),
      );
    }

    return _SupportDashboardWrapper(
      controller: _controller!,
      onBackPressed: () => Navigator.of(context).pop(),
    );
  }
}

class _SupportDashboardWrapper extends StatelessWidget {
  final SupportController controller;
  final VoidCallback onBackPressed;

  const _SupportDashboardWrapper({
    required this.controller,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('support_dashboard'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
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
              _buildEnvironmentInfo(),
              const SizedBox(height: 16),
              Obx(() => _buildQueueStatusCard()),
              const SizedBox(height: 24),
              _buildSectionTitle('support_pending_transfers'.tr),
              const SizedBox(height: 8),
              Obx(() => _buildTransfersList(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnvironmentInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.support_agent, color: Colors.orange, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${SupportEnvironment.host}:${SupportEnvironment.port}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
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

  Widget _buildTransfersList(BuildContext context) {
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
          onAccept: () => _acceptTransfer(context, transfer),
        );
      },
    );
  }

  Future<void> _acceptTransfer(
      BuildContext context, SupportTransferModel transfer) async {
    final success = await controller.acceptTransfer(transfer);
    if (success) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _SupportSessionWrapper(
              controller: controller,
              onBackPressed: () => Navigator.of(context).pop(),
            ),
          ),
        );
      }
    }
  }
}

class _SupportSessionWrapper extends StatelessWidget {
  final SupportController controller;
  final VoidCallback onBackPressed;

  const _SupportSessionWrapper({
    required this.controller,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('support_title'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
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
              final success = await controller.endSupportSession(
                resolution: resolution,
              );
              if (success && context.mounted) {
                onBackPressed();
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

class _MockSupportController extends SupportController {
  _MockSupportController()
      : super(
          provider: _MockSupportProvider(),
          operatorId: 'mock-operator',
          operatorName: 'Mock Operator',
        );

  @override
  void onInit() {
    super.onInit();
    queueStatus.value = QueueStatusModel(
      pendingTransfers: 2,
      activeSupportSessions: 1,
      availableOperators: 3,
      averageWaitTimeSeconds: 300,
    );

    pendingTransfers.addAll([
      SupportTransferModel(
        transferId: 'transfer-1',
        sessionId: 'session-1',
        userName: 'Cliente Demo 1',
        userEmail: 'cliente1@example.com',
        reason: 'Duvida sobre medicamento',
        priority: 3,
        requestedAt: DateTime.now().subtract(const Duration(minutes: 10)),
        waitTimeSeconds: 600,
        lastMessage: 'Preciso de ajuda com meu pedido',
      ),
      SupportTransferModel(
        transferId: 'transfer-2',
        sessionId: 'session-2',
        userName: 'Cliente Demo 2',
        userEmail: 'cliente2@example.com',
        reason: 'Problema com entrega',
        priority: 4,
        requestedAt: DateTime.now().subtract(const Duration(minutes: 5)),
        waitTimeSeconds: 300,
        lastMessage: 'Minha entrega esta atrasada',
      ),
    ]);
  }

  @override
  Future<void> refreshPendingTransfers() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading.value = false;
  }

  @override
  Future<bool> acceptTransfer(SupportTransferModel transfer) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    pendingTransfers.remove(transfer);

    currentSessionId.value = transfer.sessionId;
    currentTransferId.value = transfer.transferId;
    isInSupportSession.value = true;

    messages.add(SupportMessageModel(
      messageId: 'system-1',
      sessionId: transfer.sessionId,
      senderId: 'system',
      senderType: SenderType.operator,
      senderName: 'Sistema',
      content: 'Sessao de suporte iniciada',
      timestamp: DateTime.now(),
      messageType: 'system',
    ));

    isLoading.value = false;
    return true;
  }

  @override
  Future<bool> sendMessage() async {
    final content = messageController.text.trim();
    if (content.isEmpty) return false;

    messageController.clear();

    messages.add(SupportMessageModel(
      messageId: 'msg-${DateTime.now().millisecondsSinceEpoch}',
      sessionId: currentSessionId.value,
      senderId: operatorId ?? 'mock-operator',
      senderType: SenderType.operator,
      senderName: operatorName ?? 'Operador',
      content: content,
      timestamp: DateTime.now(),
      messageType: 'text',
    ));

    await Future.delayed(const Duration(seconds: 1));

    messages.add(SupportMessageModel(
      messageId: 'msg-${DateTime.now().millisecondsSinceEpoch + 1}',
      sessionId: currentSessionId.value,
      senderId: 'mock-client',
      senderType: SenderType.client,
      senderName: 'Cliente',
      content: 'Esta e uma resposta simulada do cliente.',
      timestamp: DateTime.now(),
      messageType: 'text',
    ));

    return true;
  }

  @override
  Future<bool> endSupportSession({required String resolution, String? notes}) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    currentSessionId.value = '';
    currentTransferId.value = '';
    isInSupportSession.value = false;
    messages.clear();
    isLoading.value = false;
    return true;
  }
}

class _MockSupportProvider extends SupportProvider {
  _MockSupportProvider() : super(channelFactory: _mockChannelFactory);

  static Future<Never> _mockChannelFactory() async {
    throw UnimplementedError('Mock provider does not use real gRPC channel');
  }
}
