import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/admin_layout_controller.dart';
import 'admin_header.dart';
import 'admin_sidebar.dart';

/// Main admin layout widget combining sidebar, header, and content
class AdminLayout extends StatelessWidget {
  final Widget Function(String menuId) contentBuilder;
  final List<Widget>? headerActions;

  const AdminLayout({
    super.key,
    required this.contentBuilder,
    this.headerActions,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? colorScheme.surface.withValues(alpha: 0.95)
          : const Color(0xFFF5F7FA),
      body: Row(
        children: [
          const AdminSidebar(),
          Expanded(
            child: Column(
              children: [
                AdminHeader(actions: headerActions),
                Expanded(
                  child: _buildContent(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Obx(() {
      final selectedMenuId = Get.find<AdminLayoutController>().selectedMenuId.value;

      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.02, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: Container(
          key: ValueKey(selectedMenuId),
          child: contentBuilder(selectedMenuId),
        ),
      );
    });
  }
}

/// Binding for AdminLayout
class AdminLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminLayoutController>(() => AdminLayoutController());
  }
}
