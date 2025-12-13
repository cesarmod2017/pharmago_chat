import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Menu item model for sidebar navigation
class AdminMenuItem {
  final String id;
  final String title;
  final IconData icon;
  final String? badge;
  final Color? badgeColor;

  const AdminMenuItem({
    required this.id,
    required this.title,
    required this.icon,
    this.badge,
    this.badgeColor,
  });
}

/// Controller for managing admin layout state
class AdminLayoutController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /// Sidebar expanded state
  final isExpanded = true.obs;

  /// Current selected menu item
  final selectedMenuId = 'chat'.obs;

  /// Animation controller for sidebar
  late AnimationController sidebarAnimationController;

  /// Animation for sidebar width
  late Animation<double> sidebarAnimation;

  /// Sidebar expanded width
  static const double expandedWidth = 260.0;

  /// Sidebar collapsed width
  static const double collapsedWidth = 72.0;

  /// Available menu items
  final menuItems = <AdminMenuItem>[
    const AdminMenuItem(
      id: 'chat',
      title: 'Chat',
      icon: Icons.chat_bubble_outline,
    ),
    const AdminMenuItem(
      id: 'rag',
      title: 'Base de Conhecimento',
      icon: Icons.library_books_outlined,
    ),
    const AdminMenuItem(
      id: 'support',
      title: 'Suporte',
      icon: Icons.support_agent_outlined,
    ),
    const AdminMenuItem(
      id: 'prompts',
      title: 'Prompts',
      icon: Icons.text_snippet_outlined,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<double>(
      begin: expandedWidth,
      end: collapsedWidth,
    ).animate(CurvedAnimation(
      parent: sidebarAnimationController,
      curve: Curves.easeInOut,
    ));

    // Initialize animation state based on isExpanded
    if (!isExpanded.value) {
      sidebarAnimationController.value = 1.0;
    }
  }

  @override
  void onClose() {
    sidebarAnimationController.dispose();
    super.onClose();
  }

  /// Toggle sidebar expanded/collapsed state
  void toggleSidebar() {
    if (isExpanded.value) {
      sidebarAnimationController.forward();
    } else {
      sidebarAnimationController.reverse();
    }
    isExpanded.toggle();
  }

  /// Select a menu item
  void selectMenu(String menuId) {
    if (selectedMenuId.value != menuId) {
      selectedMenuId.value = menuId;
    }
  }

  /// Get current sidebar width
  double get currentWidth =>
      isExpanded.value ? expandedWidth : collapsedWidth;

  /// Get menu item by ID
  AdminMenuItem? getMenuItem(String id) {
    try {
      return menuItems.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Get current selected menu item
  AdminMenuItem? get currentMenuItem => getMenuItem(selectedMenuId.value);
}
