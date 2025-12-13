import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';

class PromptModel {
  final String id;
  final String name;
  final String type;
  final String prompt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PromptModel({
    required this.id,
    required this.name,
    required this.type,
    required this.prompt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PromptModel.fromProto(PromptInfo proto) {
    return PromptModel(
      id: proto.id,
      name: proto.name,
      type: proto.type,
      prompt: proto.prompt,
      createdAt: proto.hasCreatedAt()
          ? proto.createdAt.toDateTime()
          : DateTime.now(),
      updatedAt: proto.hasUpdatedAt()
          ? proto.updatedAt.toDateTime()
          : DateTime.now(),
    );
  }

  PromptModel copyWith({
    String? id,
    String? name,
    String? type,
    String? prompt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PromptModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      prompt: prompt ?? this.prompt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get typeLabel {
    switch (type.toLowerCase()) {
      case 'linx':
        return 'Linx';
      case 'farmago':
        return 'FarmaGO';
      case 'aotech':
        return 'AOTech';
      case 'alpha7':
        return 'Alpha7';
      case 'pharmatec':
        return 'PharmaTec';
      case 'default':
        return 'Padrao';
      default:
        return type;
    }
  }

  String get promptPreview {
    if (prompt.length <= 100) return prompt;
    return '${prompt.substring(0, 100)}...';
  }
}
