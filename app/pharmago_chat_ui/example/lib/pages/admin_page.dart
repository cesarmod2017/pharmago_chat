import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../admin/admin_module.dart';

/// Main admin page with sidebar layout
class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminLayoutController>(
      init: AdminLayoutController(),
      builder: (controller) {
        return AdminLayout(
          contentBuilder: (menuId) => _buildContent(menuId),
        );
      },
    );
  }

  Widget _buildContent(String menuId) {
    switch (menuId) {
      case 'chat':
        return const ChatContent(key: ValueKey('chat'));
      case 'rag':
        return const RagContent(key: ValueKey('rag'));
      case 'support':
        return const SupportContent(key: ValueKey('support'));
      case 'prompts':
        return const PromptsContent(key: ValueKey('prompts'));
      default:
        return const ChatContent(key: ValueKey('chat'));
    }
  }
}
