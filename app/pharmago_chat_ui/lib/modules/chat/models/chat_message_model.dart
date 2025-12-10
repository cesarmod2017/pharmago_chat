import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';

enum MessageRole { user, assistant, system }

enum MessageStatus { sending, sent, error }

class ChatMessageModel {
  final String id;
  final MessageRole role;
  final String content;
  final DateTime timestamp;
  final MessageStatus status;
  final String? modelUsed;
  final int? tokensUsed;
  final List<String>? sources;

  const ChatMessageModel({
    required this.id,
    required this.role,
    required this.content,
    required this.timestamp,
    this.status = MessageStatus.sent,
    this.modelUsed,
    this.tokensUsed,
    this.sources,
  });

  factory ChatMessageModel.fromProto(ChatMessage proto) {
    return ChatMessageModel(
      id: proto.messageId,
      role: _parseRole(proto.role),
      content: proto.content,
      timestamp: proto.hasTimestamp()
          ? proto.timestamp.toDateTime()
          : DateTime.now(),
      modelUsed: proto.hasModelUsed() ? proto.modelUsed : null,
      tokensUsed: proto.hasTokensUsed() ? proto.tokensUsed : null,
    );
  }

  factory ChatMessageModel.user({
    required String id,
    required String content,
    DateTime? timestamp,
    MessageStatus status = MessageStatus.sending,
  }) {
    return ChatMessageModel(
      id: id,
      role: MessageRole.user,
      content: content,
      timestamp: timestamp ?? DateTime.now(),
      status: status,
    );
  }

  factory ChatMessageModel.assistant({
    required String id,
    required String content,
    DateTime? timestamp,
    String? modelUsed,
    int? tokensUsed,
    List<String>? sources,
  }) {
    return ChatMessageModel(
      id: id,
      role: MessageRole.assistant,
      content: content,
      timestamp: timestamp ?? DateTime.now(),
      modelUsed: modelUsed,
      tokensUsed: tokensUsed,
      sources: sources,
    );
  }

  ChatMessageModel copyWith({
    String? id,
    MessageRole? role,
    String? content,
    DateTime? timestamp,
    MessageStatus? status,
    String? modelUsed,
    int? tokensUsed,
    List<String>? sources,
  }) {
    return ChatMessageModel(
      id: id ?? this.id,
      role: role ?? this.role,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      modelUsed: modelUsed ?? this.modelUsed,
      tokensUsed: tokensUsed ?? this.tokensUsed,
      sources: sources ?? this.sources,
    );
  }

  static MessageRole _parseRole(String role) {
    switch (role.toLowerCase()) {
      case 'user':
        return MessageRole.user;
      case 'assistant':
        return MessageRole.assistant;
      case 'system':
        return MessageRole.system;
      default:
        return MessageRole.assistant;
    }
  }

  bool get isUser => role == MessageRole.user;
  bool get isAssistant => role == MessageRole.assistant;
  bool get isSystem => role == MessageRole.system;
  bool get isSending => status == MessageStatus.sending;
  bool get hasError => status == MessageStatus.error;
}
