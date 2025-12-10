import 'package:flutter/material.dart';

import '../theme/chat_theme.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback onSend;
  final bool enabled;
  final ChatThemeData? theme;
  final String? hintText;
  final int maxLines;
  final Widget? leading;
  final List<Widget>? trailing;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onSend,
    this.focusNode,
    this.enabled = true,
    this.theme,
    this.hintText,
    this.maxLines = 5,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final chatTheme = theme ?? ChatThemeData.fromTheme(Theme.of(context));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: chatTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: chatTheme.inputBackgroundColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        focusNode: focusNode,
                        enabled: enabled,
                        maxLines: maxLines,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                          color: chatTheme.inputTextColor,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: hintText ?? 'Digite uma mensagem...',
                          hintStyle: TextStyle(
                            color:
                                chatTheme.inputTextColor.withValues(alpha: 0.5),
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onSubmitted: (_) {
                          if (enabled) onSend();
                        },
                      ),
                    ),
                    if (trailing != null) ...trailing!,
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            _SendButton(
              onPressed: enabled ? onSend : null,
              theme: chatTheme,
            ),
          ],
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final ChatThemeData theme;

  const _SendButton({
    required this.onPressed,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: onPressed != null
          ? theme.sendButtonColor
          : theme.sendButtonColor.withValues(alpha: 0.5),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          child: Icon(
            Icons.send,
            color: Colors.white.withValues(alpha: onPressed != null ? 1.0 : 0.5),
            size: 22,
          ),
        ),
      ),
    );
  }
}
