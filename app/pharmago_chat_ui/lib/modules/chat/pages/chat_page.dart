import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../models/chat_contact_model.dart';
import '../theme/chat_theme.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_input.dart';
import '../widgets/chat_message_list.dart';

class ChatPage extends GetView<ChatController> {
  final ChatContactModel? contact;
  final ChatThemeData? theme;
  final VoidCallback? onBackPressed;
  final List<Widget>? headerActions;
  final Widget? emptyWidget;
  final String? inputHintText;

  /// If true, pressing Enter sends the message on Windows/Web.
  /// If false, CTRL+Enter is required on Windows/Web.
  /// On mobile (Android/iOS), Enter never sends - only the send button does.
  final bool sendOnEnter;

  /// Custom icon for the send button.
  final IconData? sendButtonIcon;

  const ChatPage({
    super.key,
    this.contact,
    this.theme,
    this.onBackPressed,
    this.headerActions,
    this.emptyWidget,
    this.inputHintText,
    this.sendOnEnter = true,
    this.sendButtonIcon,
  });

  @override
  Widget build(BuildContext context) {
    final chatTheme = theme ?? ChatThemeData.fromTheme(Theme.of(context));

    if (contact != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setContact(contact!);
      });
    }

    return Scaffold(
      backgroundColor: chatTheme.backgroundColor,
      appBar: _ChatAppBar(
        controller: controller,
        chatTheme: chatTheme,
        onBackPressed: onBackPressed ?? () => Get.back(),
        actions: headerActions,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.isLoading.value && controller.messages.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: chatTheme.sendButtonColor,
                      ),
                    )
                  : ChatMessageList(
                      messages: controller.messages.toList(),
                      scrollController: controller.scrollController,
                      isTyping: controller.isTyping.value,
                      theme: chatTheme,
                      onRetryLastMessage: controller.retryLastMessage,
                      emptyWidget: emptyWidget,
                    ),
            ),
          ),
          Obx(
            () => ChatInput(
              controller: controller.messageController,
              focusNode: controller.messageFocusNode,
              onSend: controller.sendMessage,
              enabled: !controller.isLoading.value &&
                  !controller.isTyping.value &&
                  controller.sessionId.value.isNotEmpty,
              theme: chatTheme,
              hintText: inputHintText,
              sendOnEnter: sendOnEnter,
              sendButtonIcon: sendButtonIcon,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatController controller;
  final ChatThemeData chatTheme;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  const _ChatAppBar({
    required this.controller,
    required this.chatTheme,
    this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChatHeader(
        contact: controller.contact.value,
        theme: chatTheme,
        onBackPressed: onBackPressed,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ChatPageWidget extends StatelessWidget {
  final ChatController controller;
  final ChatContactModel? contact;
  final ChatThemeData? theme;
  final VoidCallback? onBackPressed;
  final List<Widget>? headerActions;
  final Widget? emptyWidget;
  final String? inputHintText;
  final bool showAppBar;

  /// If true, pressing Enter sends the message on Windows/Web.
  /// If false, CTRL+Enter is required on Windows/Web.
  /// On mobile (Android/iOS), Enter never sends - only the send button does.
  final bool sendOnEnter;

  /// Custom icon for the send button.
  final IconData? sendButtonIcon;

  const ChatPageWidget({
    super.key,
    required this.controller,
    this.contact,
    this.theme,
    this.onBackPressed,
    this.headerActions,
    this.emptyWidget,
    this.inputHintText,
    this.showAppBar = true,
    this.sendOnEnter = true,
    this.sendButtonIcon,
  });

  @override
  Widget build(BuildContext context) {
    final chatTheme = theme ?? ChatThemeData.fromTheme(Theme.of(context));

    if (contact != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setContact(contact!);
      });
    }

    return Column(
      children: [
        if (showAppBar)
          Obx(
            () => ChatHeader(
              contact: controller.contact.value,
              theme: chatTheme,
              onBackPressed: onBackPressed,
              actions: headerActions,
            ),
          ),
        Expanded(
          child: Container(
            color: chatTheme.backgroundColor,
            child: Obx(
              () => controller.isLoading.value && controller.messages.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: chatTheme.sendButtonColor,
                      ),
                    )
                  : ChatMessageList(
                      messages: controller.messages.toList(),
                      scrollController: controller.scrollController,
                      isTyping: controller.isTyping.value,
                      theme: chatTheme,
                      onRetryLastMessage: controller.retryLastMessage,
                      emptyWidget: emptyWidget,
                    ),
            ),
          ),
        ),
        Obx(
          () => ChatInput(
            controller: controller.messageController,
            focusNode: controller.messageFocusNode,
            onSend: controller.sendMessage,
            enabled: !controller.isLoading.value &&
                !controller.isTyping.value &&
                controller.sessionId.value.isNotEmpty,
            theme: chatTheme,
            hintText: inputHintText,
            sendOnEnter: sendOnEnter,
            sendButtonIcon: sendButtonIcon,
          ),
        ),
      ],
    );
  }
}
