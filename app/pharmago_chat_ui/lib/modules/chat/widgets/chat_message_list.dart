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

    // Filter out empty assistant messages when typing (streaming in progress)
    final displayMessages = messages.where((m) {
      // Hide empty assistant bubbles when typing is active
      if (isTyping && !m.isUser && m.content.isEmpty) {
        return false;
      }
      return true;
    }).toList();

    // Show typing indicator only when isTyping is true AND the last assistant message is empty or doesn't exist
    final lastAssistantMessage = messages.isNotEmpty && !messages.last.isUser
        ? messages.last
        : null;
    final showTypingIndicator = isTyping &&
        (lastAssistantMessage == null || lastAssistantMessage.content.isEmpty);

    return ListView.builder(
      controller: scrollController,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      itemCount: displayMessages.length + (showTypingIndicator ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == displayMessages.length && showTypingIndicator) {
          return ChatTypingIndicator(theme: chatTheme);
        }

        final message = displayMessages[index];
        final isLastUserMessage =
            index == displayMessages.length - 1 && message.isUser;

        return ChatBubble(
          message: message,
          theme: chatTheme,
          onRetry:
              isLastUserMessage && message.hasError ? onRetryLastMessage : null,
        );
      },
    );
  }
}
