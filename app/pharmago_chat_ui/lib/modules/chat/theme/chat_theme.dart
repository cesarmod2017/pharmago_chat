import 'package:flutter/material.dart';

class ChatThemeData {
  final Color userBubbleColor;
  final Color userBubbleTextColor;
  final Color assistantBubbleColor;
  final Color assistantBubbleTextColor;
  final Color backgroundColor;
  final Color inputBackgroundColor;
  final Color inputTextColor;
  final Color sendButtonColor;
  final Color sendButtonIconColor;
  final Color headerBackgroundColor;
  final Color headerTextColor;
  final Color headerAvatarBackgroundColor;
  final Color headerAvatarTextColor;
  final Color timestampColor;
  final Color onlineIndicatorColor;

  const ChatThemeData({
    required this.userBubbleColor,
    required this.userBubbleTextColor,
    required this.assistantBubbleColor,
    required this.assistantBubbleTextColor,
    required this.backgroundColor,
    required this.inputBackgroundColor,
    required this.inputTextColor,
    required this.sendButtonColor,
    required this.sendButtonIconColor,
    required this.headerBackgroundColor,
    required this.headerTextColor,
    required this.headerAvatarBackgroundColor,
    required this.headerAvatarTextColor,
    required this.timestampColor,
    required this.onlineIndicatorColor,
  });

  factory ChatThemeData.fromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return ChatThemeData(
      userBubbleColor: colorScheme.primary,
      userBubbleTextColor: colorScheme.onPrimary,
      assistantBubbleColor: isDark
          ? colorScheme.surfaceContainerHighest
          : colorScheme.surfaceContainerHigh,
      assistantBubbleTextColor: colorScheme.onSurface,
      backgroundColor: colorScheme.surface,
      inputBackgroundColor: colorScheme.surfaceContainerHighest,
      inputTextColor: colorScheme.onSurface,
      sendButtonColor: colorScheme.primary,
      sendButtonIconColor: colorScheme.onPrimary,
      headerBackgroundColor: colorScheme.primary,
      headerTextColor: colorScheme.onPrimary,
      headerAvatarBackgroundColor: colorScheme.onPrimary.withValues(alpha: 0.2),
      headerAvatarTextColor: colorScheme.onPrimary,
      timestampColor: colorScheme.onSurfaceVariant,
      onlineIndicatorColor: const Color(0xFF4CAF50),
    );
  }

  factory ChatThemeData.light({
    Color? userBubbleColor,
    Color? userBubbleTextColor,
    Color? assistantBubbleColor,
    Color? assistantBubbleTextColor,
    Color? backgroundColor,
    Color? inputBackgroundColor,
    Color? inputTextColor,
    Color? sendButtonColor,
    Color? sendButtonIconColor,
    Color? headerBackgroundColor,
    Color? headerTextColor,
    Color? headerAvatarBackgroundColor,
    Color? headerAvatarTextColor,
    Color? timestampColor,
    Color? onlineIndicatorColor,
  }) {
    return ChatThemeData(
      userBubbleColor: userBubbleColor ?? const Color(0xFF075E54),
      userBubbleTextColor: userBubbleTextColor ?? Colors.white,
      assistantBubbleColor: assistantBubbleColor ?? Colors.white,
      assistantBubbleTextColor: assistantBubbleTextColor ?? Colors.black87,
      backgroundColor: backgroundColor ?? const Color(0xFFECE5DD),
      inputBackgroundColor: inputBackgroundColor ?? Colors.white,
      inputTextColor: inputTextColor ?? Colors.black87,
      sendButtonColor: sendButtonColor ?? const Color(0xFF075E54),
      sendButtonIconColor: sendButtonIconColor ?? Colors.white,
      headerBackgroundColor: headerBackgroundColor ?? const Color(0xFF075E54),
      headerTextColor: headerTextColor ?? Colors.white,
      headerAvatarBackgroundColor:
          headerAvatarBackgroundColor ?? Colors.white.withValues(alpha: 0.2),
      headerAvatarTextColor: headerAvatarTextColor ?? Colors.white,
      timestampColor: timestampColor ?? Colors.grey,
      onlineIndicatorColor: onlineIndicatorColor ?? const Color(0xFF4CAF50),
    );
  }

  factory ChatThemeData.dark({
    Color? userBubbleColor,
    Color? userBubbleTextColor,
    Color? assistantBubbleColor,
    Color? assistantBubbleTextColor,
    Color? backgroundColor,
    Color? inputBackgroundColor,
    Color? inputTextColor,
    Color? sendButtonColor,
    Color? sendButtonIconColor,
    Color? headerBackgroundColor,
    Color? headerTextColor,
    Color? headerAvatarBackgroundColor,
    Color? headerAvatarTextColor,
    Color? timestampColor,
    Color? onlineIndicatorColor,
  }) {
    return ChatThemeData(
      userBubbleColor: userBubbleColor ?? const Color(0xFF005C4B),
      userBubbleTextColor: userBubbleTextColor ?? Colors.white,
      assistantBubbleColor: assistantBubbleColor ?? const Color(0xFF1F2C34),
      assistantBubbleTextColor:
          assistantBubbleTextColor ?? Colors.white.withValues(alpha: 0.87),
      backgroundColor: backgroundColor ?? const Color(0xFF0B141A),
      inputBackgroundColor: inputBackgroundColor ?? const Color(0xFF1F2C34),
      inputTextColor: inputTextColor ?? Colors.white.withValues(alpha: 0.87),
      sendButtonColor: sendButtonColor ?? const Color(0xFF00A884),
      sendButtonIconColor: sendButtonIconColor ?? Colors.white,
      headerBackgroundColor: headerBackgroundColor ?? const Color(0xFF1F2C34),
      headerTextColor: headerTextColor ?? Colors.white,
      headerAvatarBackgroundColor:
          headerAvatarBackgroundColor ?? Colors.white.withValues(alpha: 0.2),
      headerAvatarTextColor: headerAvatarTextColor ?? Colors.white,
      timestampColor: timestampColor ?? Colors.grey,
      onlineIndicatorColor: onlineIndicatorColor ?? const Color(0xFF4CAF50),
    );
  }

  ChatThemeData copyWith({
    Color? userBubbleColor,
    Color? userBubbleTextColor,
    Color? assistantBubbleColor,
    Color? assistantBubbleTextColor,
    Color? backgroundColor,
    Color? inputBackgroundColor,
    Color? inputTextColor,
    Color? sendButtonColor,
    Color? sendButtonIconColor,
    Color? headerBackgroundColor,
    Color? headerTextColor,
    Color? headerAvatarBackgroundColor,
    Color? headerAvatarTextColor,
    Color? timestampColor,
    Color? onlineIndicatorColor,
  }) {
    return ChatThemeData(
      userBubbleColor: userBubbleColor ?? this.userBubbleColor,
      userBubbleTextColor: userBubbleTextColor ?? this.userBubbleTextColor,
      assistantBubbleColor: assistantBubbleColor ?? this.assistantBubbleColor,
      assistantBubbleTextColor:
          assistantBubbleTextColor ?? this.assistantBubbleTextColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      inputBackgroundColor: inputBackgroundColor ?? this.inputBackgroundColor,
      inputTextColor: inputTextColor ?? this.inputTextColor,
      sendButtonColor: sendButtonColor ?? this.sendButtonColor,
      sendButtonIconColor: sendButtonIconColor ?? this.sendButtonIconColor,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      headerTextColor: headerTextColor ?? this.headerTextColor,
      headerAvatarBackgroundColor:
          headerAvatarBackgroundColor ?? this.headerAvatarBackgroundColor,
      headerAvatarTextColor:
          headerAvatarTextColor ?? this.headerAvatarTextColor,
      timestampColor: timestampColor ?? this.timestampColor,
      onlineIndicatorColor: onlineIndicatorColor ?? this.onlineIndicatorColor,
    );
  }
}
