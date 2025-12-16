import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';
import 'package:pharmago_chat_ui/modules/chat/providers/chat_provider.dart'
    show GrpcChannelFactory;

class RagProvider {
  RAGServiceClient? _client;
  final GrpcChannelFactory _channelFactory;

  RagProvider({required GrpcChannelFactory channelFactory})
      : _channelFactory = channelFactory;

  Future<RAGServiceClient> get client async {
    if (_client == null) {
      final channel = await _channelFactory();
      _client = RAGServiceClient(channel);
    }
    return _client!;
  }

  void resetClient() {
    _client = null;
  }

  void dispose() {
    _client = null;
  }

  Future<RagAddDocumentResponse> addDocument({
    required String title,
    required String content,
    required String documentType,
    String? type,
    Map<String, String>? metadata,
    List<String>? tags,
  }) async {
    final grpcClient = await client;
    final request = RagAddDocumentRequest(
      title: title,
      content: content,
      documentType: documentType,
      type: type ?? '',
      metadata: metadata,
      tags: tags,
    );
    return grpcClient.addDocument(request);
  }

  Future<RagAddDocumentsBatchResponse> addDocumentsBatch({
    required List<RagAddDocumentRequest> documents,
  }) async {
    final grpcClient = await client;
    final request = RagAddDocumentsBatchRequest(documents: documents);
    return grpcClient.addDocumentsBatch(request);
  }

  Future<RagDeleteDocumentResponse> deleteDocument({
    required String documentId,
  }) async {
    final grpcClient = await client;
    final request = RagDeleteDocumentRequest(documentId: documentId);
    return grpcClient.deleteDocument(request);
  }

  Future<RagDeleteDocumentsBatchResponse> deleteDocumentsBatch({
    required List<String> documentIds,
  }) async {
    final grpcClient = await client;
    final request = RagDeleteDocumentsBatchRequest(documentIds: documentIds);
    return grpcClient.deleteDocumentsBatch(request);
  }

  Future<RagListDocumentsResponse> listDocuments({
    int limit = 20,
    int offset = 0,
    String? documentTypeFilter,
    String? typeFilter,
    List<String>? tagFilter,
  }) async {
    final grpcClient = await client;
    final request = RagListDocumentsRequest(
      limit: limit,
      offset: offset,
      documentTypeFilter: documentTypeFilter ?? '',
      typeFilter: typeFilter ?? '',
      tagFilter: tagFilter,
    );
    return grpcClient.listDocuments(request);
  }

  Future<RagDocumentInfo> getDocument({
    required String documentId,
  }) async {
    final grpcClient = await client;
    final request = RagGetDocumentRequest(documentId: documentId);
    return grpcClient.getDocument(request);
  }

  Future<RagSearchDocumentsResponse> searchDocuments({
    required String query,
    int limit = 10,
    double similarityThreshold = 0.7,
    String? typeFilter,
    List<String>? tagFilter,
  }) async {
    final grpcClient = await client;
    final request = RagSearchDocumentsRequest(
      query: query,
      limit: limit,
      similarityThreshold: similarityThreshold,
      typeFilter: typeFilter ?? '',
      tagFilter: tagFilter,
    );
    return grpcClient.searchDocuments(request);
  }

  // ============================================================================
  // EmbeddingDocument operations
  // ============================================================================

  Future<RagAddEmbeddingDocumentResponse> addEmbeddingDocument({
    required String content,
    Map<String, String>? metadata,
  }) async {
    final grpcClient = await client;
    final request = RagAddEmbeddingDocumentRequest(
      content: content,
      metadata: metadata,
    );
    return grpcClient.addEmbeddingDocument(request);
  }

  Future<RagDeleteEmbeddingDocumentResponse> deleteEmbeddingDocument({
    required int documentId,
  }) async {
    final grpcClient = await client;
    final request = RagDeleteEmbeddingDocumentRequest(
      documentId: Int64(documentId),
    );
    return grpcClient.deleteEmbeddingDocument(request);
  }

  Future<RagSearchEmbeddingDocumentsResponse> searchEmbeddingDocuments({
    required String query,
    int limit = 5,
    Map<String, String>? filter,
  }) async {
    final grpcClient = await client;
    final request = RagSearchEmbeddingDocumentsRequest(
      query: query,
      limit: limit,
      filter: filter,
    );
    return grpcClient.searchEmbeddingDocuments(request);
  }

  // ============================================================================
  // Batch File Upload (Server Streaming)
  // ============================================================================

  /// Uploads multiple files in batch and streams progress notifications.
  /// Returns a Stream of [RagUploadFileProgress] for each file's progress.
  Stream<RagUploadFileProgress> uploadFilesBatch({
    required List<RagUploadFile> files,
  }) async* {
    final grpcClient = await client;
    final request = RagUploadFilesBatchRequest(files: files);

    final responseStream = grpcClient.uploadFilesBatch(request);

    await for (final progress in responseStream) {
      yield progress;
    }
  }

  /// Creates a [RagUploadFile] from file data.
  /// Helper method for creating upload file objects.
  RagUploadFile createUploadFile({
    required String fileName,
    required String content,
    String? documentType,
    String? type,
    Map<String, String>? metadata,
    List<String>? tags,
  }) {
    return RagUploadFile(
      fileName: fileName,
      content: content,
      documentType: documentType ?? '',
      type: type ?? '',
      metadata: metadata,
      tags: tags,
    );
  }
}
