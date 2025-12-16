import 'package:flutter/material.dart';

class ChatContactModel {
  final String name;
  final String? avatarUrl;
  final String? subtitle;
  final bool isOnline;
  final Color? avatarBackgroundColor;

  const ChatContactModel({
    required this.name,
    this.avatarUrl,
    this.subtitle,
    this.isOnline = true,
    this.avatarBackgroundColor,
  });

  factory ChatContactModel.defaultBot() {
    return const ChatContactModel(
      name: 'Assistente PharmaGO',
      subtitle: 'Online',
      isOnline: true,
    );
  }

  factory ChatContactModel.fromJson(Map<String, dynamic> json) {
    return ChatContactModel(
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      subtitle: json['subtitle'] as String?,
      isOnline: json['isOnline'] as bool? ?? true,
      avatarBackgroundColor: json['avatarBackgroundColor'] != null
          ? Color(json['avatarBackgroundColor'] as int)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
      'subtitle': subtitle,
      'isOnline': isOnline,
      'avatarBackgroundColor': avatarBackgroundColor?.value,
    };
  }

  ChatContactModel copyWith({
    String? name,
    String? avatarUrl,
    String? subtitle,
    bool? isOnline,
    Color? avatarBackgroundColor,
  }) {
    return ChatContactModel(
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      subtitle: subtitle ?? this.subtitle,
      isOnline: isOnline ?? this.isOnline,
      avatarBackgroundColor:
          avatarBackgroundColor ?? this.avatarBackgroundColor,
    );
  }
}
