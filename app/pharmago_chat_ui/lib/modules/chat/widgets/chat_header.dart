import 'package:flutter/material.dart';

import '../models/chat_contact_model.dart';
import '../theme/chat_theme.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  final ChatContactModel contact;
  final ChatThemeData? theme;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Widget? leading;

  const ChatHeader({
    super.key,
    required this.contact,
    this.theme,
    this.onBackPressed,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final chatTheme = theme ?? ChatThemeData.fromTheme(Theme.of(context));

    return AppBar(
      backgroundColor: chatTheme.headerBackgroundColor,
      foregroundColor: chatTheme.headerTextColor,
      leading: leading ??
          (onBackPressed != null
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBackPressed,
                )
              : null),
      titleSpacing: 0,
      title: Row(
        children: [
          _buildAvatar(chatTheme),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  contact.name,
                  style: TextStyle(
                    color: chatTheme.headerTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (contact.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      if (contact.isOnline) ...[
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: chatTheme.onlineIndicatorColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          contact.subtitle!,
                          style: TextStyle(
                            color: chatTheme.headerTextColor
                                .withValues(alpha: 0.7),
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      actions: actions,
    );
  }

  Widget _buildAvatar(ChatThemeData chatTheme) {
    if (contact.avatarUrl != null && contact.avatarUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(contact.avatarUrl!),
        backgroundColor: chatTheme.headerAvatarBackgroundColor,
      );
    }

    return CircleAvatar(
      radius: 20,
      backgroundColor: chatTheme.headerAvatarBackgroundColor,
      child: Text(
        _getInitials(contact.name),
        style: TextStyle(
          color: chatTheme.headerAvatarTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  /// Generates initials from the contact name.
  /// For "Cesar Mesquita" returns "CM".
  /// For single names like "Assistente" returns "A".
  String _getInitials(String name) {
    if (name.isEmpty) return '?';

    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length >= 2) {
      return '${words.first[0]}${words.last[0]}'.toUpperCase();
    }
    return words.first[0].toUpperCase();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
