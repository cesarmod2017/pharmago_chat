import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';

class RagDocumentModel {
  final String documentId;
  final String title;
  final String documentType;
  final String type;
  final int chunkCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, String> metadata;
  final List<String> tags;
  final int contentLength;

  const RagDocumentModel({
    required this.documentId,
    required this.title,
    required this.documentType,
    required this.type,
    required this.chunkCount,
    required this.createdAt,
    required this.updatedAt,
    required this.metadata,
    required this.tags,
    required this.contentLength,
  });

  factory RagDocumentModel.fromProto(RagDocumentInfo proto) {
    return RagDocumentModel(
      documentId: proto.documentId,
      title: proto.title,
      documentType: proto.documentType,
      type: proto.type,
      chunkCount: proto.chunkCount,
      createdAt: proto.hasCreatedAt()
          ? proto.createdAt.toDateTime()
          : DateTime.now(),
      updatedAt: proto.hasUpdatedAt()
          ? proto.updatedAt.toDateTime()
          : DateTime.now(),
      metadata: Map<String, String>.from(proto.metadata),
      tags: proto.tags.toList(),
      contentLength: proto.contentLength,
    );
  }

  RagDocumentModel copyWith({
    String? documentId,
    String? title,
    String? documentType,
    String? type,
    int? chunkCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, String>? metadata,
    List<String>? tags,
    int? contentLength,
  }) {
    return RagDocumentModel(
      documentId: documentId ?? this.documentId,
      title: title ?? this.title,
      documentType: documentType ?? this.documentType,
      type: type ?? this.type,
      chunkCount: chunkCount ?? this.chunkCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
      tags: tags ?? this.tags,
      contentLength: contentLength ?? this.contentLength,
    );
  }

  String get documentTypeLabel {
    switch (documentType.toLowerCase()) {
      case 'text':
        return 'Texto';
      case 'markdown':
        return 'Markdown';
      case 'pdf_text':
        return 'PDF';
      case 'html':
        return 'HTML';
      default:
        return documentType;
    }
  }
}

class RagSearchResultModel {
  final String documentId;
  final String chunkId;
  final String title;
  final String content;
  final double similarityScore;
  final Map<String, String> metadata;

  const RagSearchResultModel({
    required this.documentId,
    required this.chunkId,
    required this.title,
    required this.content,
    required this.similarityScore,
    required this.metadata,
  });

  factory RagSearchResultModel.fromProto(RagSearchResult proto) {
    return RagSearchResultModel(
      documentId: proto.documentId,
      chunkId: proto.chunkId,
      title: proto.title,
      content: proto.content,
      similarityScore: proto.similarityScore,
      metadata: Map<String, String>.from(proto.metadata),
    );
  }

  int get similarityPercent => (similarityScore * 100).round();
}

// ============================================================================
// EmbeddingDocument Models
// ============================================================================

class RagEmbeddingDocumentModel {
  final int id;
  final String content;
  final Map<String, String> metadata;

  const RagEmbeddingDocumentModel({
    required this.id,
    required this.content,
    required this.metadata,
  });

  factory RagEmbeddingDocumentModel.fromProto(RagEmbeddingSearchResult proto) {
    return RagEmbeddingDocumentModel(
      id: proto.id.toInt(),
      content: proto.content,
      metadata: Map<String, String>.from(proto.metadata),
    );
  }

  RagEmbeddingDocumentModel copyWith({
    int? id,
    String? content,
    Map<String, String>? metadata,
  }) {
    return RagEmbeddingDocumentModel(
      id: id ?? this.id,
      content: content ?? this.content,
      metadata: metadata ?? this.metadata,
    );
  }

  String get contentPreview {
    if (content.length <= 100) return content;
    return '${content.substring(0, 100)}...';
  }
}

class RagEmbeddingSearchResultModel {
  final int id;
  final String content;
  final Map<String, String> metadata;
  final double similarityScore;

  const RagEmbeddingSearchResultModel({
    required this.id,
    required this.content,
    required this.metadata,
    required this.similarityScore,
  });

  factory RagEmbeddingSearchResultModel.fromProto(RagEmbeddingSearchResult proto) {
    return RagEmbeddingSearchResultModel(
      id: proto.id.toInt(),
      content: proto.content,
      metadata: Map<String, String>.from(proto.metadata),
      similarityScore: proto.similarityScore,
    );
  }

  int get similarityPercent => (similarityScore * 100).round();

  String get contentPreview {
    if (content.length <= 150) return content;
    return '${content.substring(0, 150)}...';
  }
}

// ============================================================================
// Batch File Upload Models
// ============================================================================

/// Status of a file upload in batch
enum RagFileUploadStatus {
  pending,
  received,
  processing,
  completed,
  failed,
}

/// Model representing a file selected for batch upload
class RagUploadFileModel {
  final String fileName;
  final String content;
  final int fileSize;
  final String documentType;
  final RagFileUploadStatus status;
  final String? statusMessage;
  final int? documentId;
  final String? error;

  const RagUploadFileModel({
    required this.fileName,
    required this.content,
    required this.fileSize,
    required this.documentType,
    this.status = RagFileUploadStatus.pending,
    this.statusMessage,
    this.documentId,
    this.error,
  });

  RagUploadFileModel copyWith({
    String? fileName,
    String? content,
    int? fileSize,
    String? documentType,
    RagFileUploadStatus? status,
    String? statusMessage,
    int? documentId,
    String? error,
  }) {
    return RagUploadFileModel(
      fileName: fileName ?? this.fileName,
      content: content ?? this.content,
      fileSize: fileSize ?? this.fileSize,
      documentType: documentType ?? this.documentType,
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      documentId: documentId ?? this.documentId,
      error: error ?? this.error,
    );
  }

  /// Detects document type from file extension
  static String detectDocumentType(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'md':
        return 'markdown';
      case 'txt':
        return 'text';
      case 'html':
      case 'htm':
        return 'html';
      default:
        return 'text';
    }
  }

  /// Returns formatted file size string
  String get fileSizeFormatted {
    if (fileSize < 1024) {
      return '$fileSize B';
    } else if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  /// Returns the document type label for display
  String get documentTypeLabel {
    switch (documentType.toLowerCase()) {
      case 'text':
        return 'Texto';
      case 'markdown':
        return 'Markdown';
      case 'html':
        return 'HTML';
      default:
        return documentType;
    }
  }

  /// Returns true if the file upload is in a terminal state
  bool get isTerminal =>
      status == RagFileUploadStatus.completed ||
      status == RagFileUploadStatus.failed;
}

/// Model for batch upload summary
class RagBatchUploadSummary {
  final int totalFiles;
  final int completedFiles;
  final int failedFiles;
  final int pendingFiles;

  const RagBatchUploadSummary({
    required this.totalFiles,
    required this.completedFiles,
    required this.failedFiles,
    required this.pendingFiles,
  });

  double get progressPercent =>
      totalFiles > 0 ? (completedFiles + failedFiles) / totalFiles : 0.0;

  bool get isComplete => pendingFiles == 0 && totalFiles > 0;

  bool get hasErrors => failedFiles > 0;
}
