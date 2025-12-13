import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/admin_layout_controller.dart';

/// Admin sidebar widget with expand/collapse functionality
class AdminSidebar extends GetView<AdminLayoutController> {
  const AdminSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: controller.sidebarAnimationController,
      builder: (context, child) {
        final width = controller.sidebarAnimation.value;
        final isCollapsed = width < AdminLayoutController.expandedWidth * 0.6;

        return Container(
          width: width,
          decoration: BoxDecoration(
            color: isDark ? colorScheme.surface : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(2, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildLogo(context, isCollapsed),
              const SizedBox(height: 8),
              Expanded(
                child: _buildMenuItems(context, isCollapsed),
              ),
              _buildFooter(context, isCollapsed),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo(BuildContext context, bool isCollapsed) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(
        horizontal: isCollapsed ? 12 : 20,
        vertical: 12,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withValues(alpha: 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.medical_services_outlined,
              color: Colors.white,
              size: 22,
            ),
          ),
          if (!isCollapsed) ...[
            const SizedBox(width: 12),
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isCollapsed ? 0 : 1,
                child: Text(
                  'PharmaGO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                    letterSpacing: -0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, bool isCollapsed) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: isCollapsed ? 8 : 12,
        vertical: 8,
      ),
      itemCount: controller.menuItems.length,
      itemBuilder: (context, index) {
        final item = controller.menuItems[index];
        return _buildMenuItem(context, item, isCollapsed);
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    AdminMenuItem item,
    bool isCollapsed,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(() {
      final isSelected = controller.selectedMenuId.value == item.id;

      return Tooltip(
        message: isCollapsed ? item.title : '',
        preferBelow: false,
        waitDuration: const Duration(milliseconds: 500),
        child: Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () => controller.selectMenu(item.id),
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: isCollapsed ? 14 : 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorScheme.primary.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? colorScheme.primary.withValues(alpha: 0.3)
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 4,
                      height: 24,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? colorScheme.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Icon(
                      item.icon,
                      size: 22,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    if (!isCollapsed) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: isCollapsed ? 0 : 1,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  isSelected ? FontWeight.w600 : FontWeight.w500,
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.onSurface.withValues(alpha: 0.8),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      if (item.badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: item.badgeColor ?? colorScheme.error,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            item.badge!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildFooter(BuildContext context, bool isCollapsed) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(isCollapsed ? 8 : 16),
      child: Column(
        children: [
          Divider(
            color: colorScheme.outline.withValues(alpha: 0.2),
            height: 1,
          ),
          const SizedBox(height: 12),
          if (!isCollapsed)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isCollapsed ? 0 : 1,
              child: Text(
                'Chat Suite v1.0',
                style: TextStyle(
                  fontSize: 11,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ),
          if (isCollapsed)
            Icon(
              Icons.info_outline,
              size: 18,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
        ],
      ),
    );
  }
}
