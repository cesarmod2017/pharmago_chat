import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  /// If true, pressing Enter sends the message on Windows/Web.
  /// If false, CTRL+Enter is required on Windows/Web.
  /// On mobile (Android/iOS), Enter never sends - only the send button does.
  final bool sendOnEnter;

  /// Custom icon for the send button.
  final IconData? sendButtonIcon;

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
    this.sendOnEnter = true,
    this.sendButtonIcon,
  });

  bool get _isMobile =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  bool get _isDesktopOrWeb =>
      kIsWeb ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux;

  void _handleKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return;
    if (!enabled) return;

    final isEnterKey = event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.numpadEnter;
    if (!isEnterKey) return;

    // On mobile, Enter never sends - only the send button does
    if (_isMobile) return;

    // On desktop/web
    if (_isDesktopOrWeb) {
      final isCtrlPressed = HardwareKeyboard.instance.isControlPressed;
      final isShiftPressed = HardwareKeyboard.instance.isShiftPressed;

      // Shift+Enter always inserts newline
      if (isShiftPressed) return;

      if (sendOnEnter) {
        // Enter sends, Ctrl+Enter for newline
        if (!isCtrlPressed) {
          _sendIfValid();
        }
      } else {
        // Ctrl+Enter sends
        if (isCtrlPressed) {
          _sendIfValid();
        }
      }
    }
  }

  void _sendIfValid() {
    if (enabled && controller.text.trim().isNotEmpty) {
      onSend();
    }
  }

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
                      child: KeyboardListener(
                        focusNode: FocusNode(),
                        onKeyEvent: _handleKeyEvent,
                        child: TextField(
                          controller: controller,
                          focusNode: focusNode,
                          enabled: enabled,
                          maxLines: maxLines,
                          minLines: 1,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: _isMobile
                              ? TextInputAction.newline
                              : (sendOnEnter
                                  ? TextInputAction.send
                                  : TextInputAction.newline),
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(
                            color: chatTheme.inputTextColor,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText: hintText ?? 'Digite uma mensagem...',
                            hintStyle: TextStyle(
                              color: chatTheme.inputTextColor
                                  .withValues(alpha: 0.5),
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          onSubmitted: (_) {
                            // onSubmitted is called when textInputAction is send
                            if (enabled && _isDesktopOrWeb && sendOnEnter) {
                              onSend();
                            }
                          },
                        ),
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
              icon: sendButtonIcon,
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
  final IconData? icon;

  const _SendButton({
    required this.onPressed,
    required this.theme,
    this.icon,
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
            icon ?? Icons.send,
            color: theme.sendButtonIconColor
                .withValues(alpha: onPressed != null ? 1.0 : 0.5),
            size: 22,
          ),
        ),
      ),
    );
  }
}
