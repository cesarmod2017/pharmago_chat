import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../theme/chat_theme.dart';

/// Widget que exibe uma tela de erro amigável quando a conexão gRPC falha.
/// Inclui botão "Falar com Atendente" que força reconexão.
class ChatConnectionError extends StatelessWidget {
  final ChatController controller;
  final ChatThemeData theme;
  final VoidCallback? onRetrySuccess;

  const ChatConnectionError({
    super.key,
    required this.controller,
    required this.theme,
    this.onRetrySuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.backgroundColor,
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Obx(() {
          final isConnecting =
              controller.connectionState.value == ChatConnectionState.connecting;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone de erro/conexão
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isConnecting
                    ? SizedBox(
                        key: const ValueKey('loading'),
                        width: 64,
                        height: 64,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: theme.sendButtonColor,
                        ),
                      )
                    : Icon(
                        key: const ValueKey('error'),
                        Icons.wifi_off_rounded,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
              ),
              const SizedBox(height: 24),

              // Título
              Text(
                'chat_connection_error_title'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.assistantBubbleTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Mensagem
              Text(
                isConnecting
                    ? 'chat_connecting'.tr
                    : 'chat_connection_error_message'.tr,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Info do intervalo de reconexão
              if (!isConnecting && controller.isReconnecting.value)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'chat_reconnecting_in'.trParams({
                      'seconds': controller.currentReconnectInterval.toString(),
                    }),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 32),

              // Botão "Falar com Atendente"
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: isConnecting ? null : _onTalkToAttendant,
                  icon: Icon(
                    Icons.support_agent_rounded,
                    color: isConnecting ? Colors.grey : theme.sendButtonIconColor,
                  ),
                  label: Text(
                    'chat_talk_to_attendant'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isConnecting ? Colors.grey : theme.sendButtonIconColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isConnecting ? Colors.grey.shade300 : theme.sendButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: isConnecting ? 0 : 2,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Botão secundário "Tentar novamente"
              TextButton.icon(
                onPressed: isConnecting ? null : _onRetry,
                icon: Icon(
                  Icons.refresh_rounded,
                  size: 20,
                  color: isConnecting ? Colors.grey : theme.sendButtonColor,
                ),
                label: Text(
                  'chat_retry'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: isConnecting ? Colors.grey : theme.sendButtonColor,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Future<void> _onTalkToAttendant() async {
    final success = await controller.forceReconnect();
    if (success && onRetrySuccess != null) {
      onRetrySuccess!();
    }
  }

  Future<void> _onRetry() async {
    final success = await controller.forceReconnect();
    if (success && onRetrySuccess != null) {
      onRetrySuccess!();
    }
  }
}
