class ChatContactModel {
  final String name;
  final String? avatarUrl;
  final String? subtitle;
  final bool isOnline;

  const ChatContactModel({
    required this.name,
    this.avatarUrl,
    this.subtitle,
    this.isOnline = true,
  });

  factory ChatContactModel.defaultBot() {
    return const ChatContactModel(
      name: 'Assistente PharmaGO',
      subtitle: 'Online',
      isOnline: true,
    );
  }
}
