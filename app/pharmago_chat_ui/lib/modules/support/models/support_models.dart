import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';

enum TransferStatus { pending, accepted, ended }

enum SenderType { client, operator }

enum Resolution { resolved, returnedToBot, closed }

class SupportTransferModel {
  final String transferId;
  final String sessionId;
  final String userName;
  final String userEmail;
  final String reason;
  final int priority;
  final DateTime requestedAt;
  final int waitTimeSeconds;
  final String lastMessage;

  const SupportTransferModel({
    required this.transferId,
    required this.sessionId,
    required this.userName,
    required this.userEmail,
    required this.reason,
    required this.priority,
    required this.requestedAt,
    required this.waitTimeSeconds,
    required this.lastMessage,
  });

  factory SupportTransferModel.fromProto(SupportTransferRequest proto) {
    return SupportTransferModel(
      transferId: proto.transferId,
      sessionId: proto.sessionId,
      userName: proto.userName,
      userEmail: proto.userEmail,
      reason: proto.reason,
      priority: proto.priority,
      requestedAt: proto.hasRequestedAt()
          ? proto.requestedAt.toDateTime()
          : DateTime.now(),
      waitTimeSeconds: proto.waitTimeSeconds,
      lastMessage: proto.lastMessage,
    );
  }

  String get priorityLabel {
    switch (priority) {
      case 5:
        return 'Urgente';
      case 4:
        return 'Alta';
      case 3:
        return 'Normal';
      case 2:
        return 'Baixa';
      case 1:
        return 'Muito Baixa';
      default:
        return 'Normal';
    }
  }

  String get waitTimeFormatted {
    if (waitTimeSeconds < 60) {
      return '${waitTimeSeconds}s';
    } else if (waitTimeSeconds < 3600) {
      return '${(waitTimeSeconds / 60).floor()}m';
    } else {
      return '${(waitTimeSeconds / 3600).floor()}h ${((waitTimeSeconds % 3600) / 60).floor()}m';
    }
  }
}

class SupportMessageModel {
  final String messageId;
  final String sessionId;
  final String senderId;
  final SenderType senderType;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final String messageType;

  const SupportMessageModel({
    required this.messageId,
    required this.sessionId,
    required this.senderId,
    required this.senderType,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.messageType,
  });

  factory SupportMessageModel.fromProto(SupportMessage proto) {
    return SupportMessageModel(
      messageId: proto.messageId,
      sessionId: proto.sessionId,
      senderId: proto.senderId,
      senderType: _parseSenderType(proto.senderType),
      senderName: proto.senderName,
      content: proto.content,
      timestamp: proto.hasTimestamp()
          ? proto.timestamp.toDateTime()
          : DateTime.now(),
      messageType: proto.messageType,
    );
  }

  static SenderType _parseSenderType(String type) {
    switch (type.toLowerCase()) {
      case 'operator':
        return SenderType.operator;
      case 'client':
      default:
        return SenderType.client;
    }
  }

  bool get isFromOperator => senderType == SenderType.operator;
  bool get isFromClient => senderType == SenderType.client;
  bool get isSystemMessage => messageType == 'system' || messageType == 'transfer_notice';
}

class QueueStatusModel {
  final int pendingTransfers;
  final int activeSupportSessions;
  final int availableOperators;
  final double averageWaitTimeSeconds;

  const QueueStatusModel({
    required this.pendingTransfers,
    required this.activeSupportSessions,
    required this.availableOperators,
    required this.averageWaitTimeSeconds,
  });

  factory QueueStatusModel.fromProto(SupportQueueStatusResponse proto) {
    return QueueStatusModel(
      pendingTransfers: proto.pendingTransfers,
      activeSupportSessions: proto.activeSupportSessions,
      availableOperators: proto.availableOperators,
      averageWaitTimeSeconds: proto.averageWaitTimeSeconds,
    );
  }

  String get averageWaitTimeFormatted {
    final seconds = averageWaitTimeSeconds.round();
    if (seconds < 60) {
      return '${seconds}s';
    } else if (seconds < 3600) {
      return '${(seconds / 60).floor()}m';
    } else {
      return '${(seconds / 3600).floor()}h ${((seconds % 3600) / 60).floor()}m';
    }
  }
}

class SupportChatHistoryModel {
  final String messageId;
  final String role;
  final String content;
  final DateTime timestamp;
  final String? modelUsed;
  final int? tokensUsed;

  const SupportChatHistoryModel({
    required this.messageId,
    required this.role,
    required this.content,
    required this.timestamp,
    this.modelUsed,
    this.tokensUsed,
  });

  factory SupportChatHistoryModel.fromProto(SupportChatMessage proto) {
    return SupportChatHistoryModel(
      messageId: proto.messageId,
      role: proto.role,
      content: proto.content,
      timestamp: proto.hasTimestamp()
          ? proto.timestamp.toDateTime()
          : DateTime.now(),
      modelUsed: proto.hasModelUsed() ? proto.modelUsed : null,
      tokensUsed: proto.hasTokensUsed() ? proto.tokensUsed : null,
    );
  }

  bool get isUser => role == 'user';
  bool get isAssistant => role == 'assistant';
  bool get isSystem => role == 'system';
}
