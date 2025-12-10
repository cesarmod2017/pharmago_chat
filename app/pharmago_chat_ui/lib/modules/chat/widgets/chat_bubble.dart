import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/chat_message_model.dart';
import '../theme/chat_theme.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageModel message;
  final ChatThemeData? theme;
  final VoidCallback? onRetry;
  final bool showTimestamp;
  final EdgeInsets? margin;

  const ChatBubble({
    super.key,
    required this.message,
    this.theme,
    this.onRetry,
    this.showTimestamp = true,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final chatTheme = theme ?? ChatThemeData.fromTheme(Theme.of(context));
    final isUser = message.isUser;

    return Container(
      margin: margin ??
          EdgeInsets.only(
            left: isUser ? 64 : 16,
            right: isUser ? 16 : 64,
            top: 4,
            bottom: 4,
          ),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.hasError && onRetry != null) ...[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.red[400],
                size: 20,
              ),
              onPressed: onRetry,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: isUser
                    ? chatTheme.userBubbleColor
                    : chatTheme.assistantBubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isUser ? 16 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    message.content,
                    style: TextStyle(
                      color: isUser
                          ? chatTheme.userBubbleTextColor
                          : chatTheme.assistantBubbleTextColor,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  if (showTimestamp) ...[
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _formatTimestamp(message.timestamp),
                          style: TextStyle(
                            color: (isUser
                                    ? chatTheme.userBubbleTextColor
                                    : chatTheme.assistantBubbleTextColor)
                                .withValues(alpha: 0.6),
                            fontSize: 11,
                          ),
                        ),
                        if (message.isSending) ...[
                          const SizedBox(width: 4),
                          SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                              color: isUser
                                  ? chatTheme.userBubbleTextColor
                                      .withValues(alpha: 0.6)
                                  : chatTheme.assistantBubbleTextColor
                                      .withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                        if (message.hasError) ...[
                          const SizedBox(width: 4),
                          Icon(
                            Icons.error_outline,
                            size: 14,
                            color: Colors.red[300],
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate =
        DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (messageDate == today) {
      return DateFormat.Hm().format(timestamp);
    } else if (messageDate == today.subtract(const Duration(days: 1))) {
      return 'Ontem ${DateFormat.Hm().format(timestamp)}';
    } else {
      return DateFormat('dd/MM HH:mm').format(timestamp);
    }
  }
}
