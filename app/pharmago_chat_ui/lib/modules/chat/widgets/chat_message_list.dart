import 'package:flutter/material.dart';

import '../models/chat_message_model.dart';
import '../theme/chat_theme.dart';
import 'chat_bubble.dart';
import 'chat_typing_indicator.dart';

class ChatMessageList extends StatelessWidget {
  final List<ChatMessageModel> messages;
  final ScrollController? scrollController;
  final bool isTyping;
  final ChatThemeData? theme;
  final VoidCallback? onRetryLastMessage;
  final Widget? emptyWidget;
  final EdgeInsets? padding;

  const ChatMessageList({
    super.key,
    required this.messages,
    this.scrollController,
    this.isTyping = false,
    this.theme,
    this.onRetryLastMessage,
    this.emptyWidget,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final chatTheme = theme ?? ChatThemeData.fromTheme(Theme.of(context));

    if (messages.isEmpty && !isTyping) {
      return emptyWidget ??
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 64,
                  color: chatTheme.timestampColor.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'Inicie uma conversa',
                  style: TextStyle(
                    color: chatTheme.timestampColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
    }

    return ListView.builder(
      controller: scrollController,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      itemCount: messages.length + (isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == messages.length && isTyping) {
          return ChatTypingIndicator(theme: chatTheme);
        }

        final message = messages[index];
        final isLastUserMessage = index == messages.length - 1 && message.isUser;

        return ChatBubble(
          message: message,
          theme: chatTheme,
          onRetry: isLastUserMessage && message.hasError ? onRetryLastMessage : null,
        );
      },
    );
  }
}
