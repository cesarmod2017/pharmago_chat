import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../models/chat_contact_model.dart';
import '../theme/chat_theme.dart';
import '../widgets/chat_connection_error.dart';
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

  /// Override for the input background color (takes precedence over theme).
  final Color? inputBackgroundColor;

  /// Override for the input border color (takes precedence over theme).
  final Color? inputBorderColor;

  /// Override for the input hint/placeholder color (takes precedence over theme).
  final Color? inputHintColor;

  /// Override for the input text color (takes precedence over theme).
  final Color? inputTextColor;

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
    this.inputBackgroundColor,
    this.inputBorderColor,
    this.inputHintColor,
    this.inputTextColor,
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
              enabled:
                  !controller.isLoading.value &&
                  !controller.isTyping.value &&
                  controller.sessionId.value.isNotEmpty,
              theme: chatTheme,
              hintText: inputHintText,
              sendOnEnter: sendOnEnter,
              sendButtonIcon: sendButtonIcon,
              inputBackgroundColor: inputBackgroundColor,
              inputBorderColor: inputBorderColor,
              inputHintColor: inputHintColor,
              inputTextColor: inputTextColor,
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

class ChatPageWidget extends StatefulWidget {
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

  /// Override for the input background color (takes precedence over theme).
  final Color? inputBackgroundColor;

  /// Override for the input border color (takes precedence over theme).
  final Color? inputBorderColor;

  /// Override for the input hint/placeholder color (takes precedence over theme).
  final Color? inputHintColor;

  /// Override for the input text color (takes precedence over theme).
  final Color? inputTextColor;

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
    this.inputBackgroundColor,
    this.inputBorderColor,
    this.inputHintColor,
    this.inputTextColor,
  });

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Forçar verificação de conexão ao abrir a tela
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.ensureConnected();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Forçar reconexão quando o app volta ao primeiro plano
    if (state == AppLifecycleState.resumed) {
      widget.controller.ensureConnected();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatTheme =
        widget.theme ?? ChatThemeData.fromTheme(Theme.of(context));

    if (widget.contact != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.controller.setContact(widget.contact!);
      });
    }

    return Column(
      children: [
        if (widget.showAppBar)
          Obx(
            () => ChatHeader(
              contact: widget.controller.contact.value,
              theme: chatTheme,
              onBackPressed: widget.onBackPressed,
              actions: widget.headerActions,
            ),
          ),
        Expanded(
          child: Container(
            color: chatTheme.backgroundColor,
            child: Obx(() {
              // Mostrar tela de erro se houver erro de conexão persistente
              if (widget.controller.hasConnectionError.value &&
                  widget.controller.sessionId.value.isEmpty) {
                return ChatConnectionError(
                  controller: widget.controller,
                  theme: chatTheme,
                );
              }

              // Mostrar loading se estiver carregando e não houver mensagens
              if (widget.controller.isLoading.value &&
                  widget.controller.messages.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                    color: chatTheme.sendButtonColor,
                  ),
                );
              }

              // Mostrar lista de mensagens
              return ChatMessageList(
                messages: widget.controller.messages.toList(),
                scrollController: widget.controller.scrollController,
                isTyping: widget.controller.isTyping.value,
                theme: chatTheme,
                onRetryLastMessage: widget.controller.retryLastMessage,
                emptyWidget: widget.emptyWidget,
              );
            }),
          ),
        ),
        Obx(
          () => ChatInput(
            controller: widget.controller.messageController,
            focusNode: widget.controller.messageFocusNode,
            onSend: widget.controller.sendMessage,
            enabled: !widget.controller.isLoading.value &&
                !widget.controller.isTyping.value &&
                widget.controller.sessionId.value.isNotEmpty &&
                !widget.controller.hasConnectionError.value,
            theme: chatTheme,
            hintText: widget.inputHintText,
            sendOnEnter: widget.sendOnEnter,
            sendButtonIcon: widget.sendButtonIcon,
            inputBackgroundColor: widget.inputBackgroundColor,
            inputBorderColor: widget.inputBorderColor,
            inputHintColor: widget.inputHintColor,
            inputTextColor: widget.inputTextColor,
          ),
        ),
      ],
    );
  }
}
