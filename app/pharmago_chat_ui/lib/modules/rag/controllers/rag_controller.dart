import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/src/grpc/grpc_exports.dart';

import '../models/rag_document_model.dart';
import '../providers/rag_provider.dart';

class RagController extends GetxController {
  final RagProvider provider;

  RagController({required this.provider});

  final documents = <RagDocumentModel>[].obs;
  final searchResults = <RagSearchResultModel>[].obs;
  final isLoading = false.obs;
  final isSearching = false.obs;
  final error = Rxn<String>();
  final selectedDocument = Rxn<RagDocumentModel>();
  final totalCount = 0.obs;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  final selectedDocumentType = 'text'.obs;
  final selectedCategory = 'support_app'.obs;
  final selectedTags = <String>[].obs;

  // Available category types (shared with Prompts module)
  final List<String> availableCategories = [
    'support_app',
    'support_manager',
    'support_sales',
    'other',
  ];

  // EmbeddingDocument state
  final embeddingDocuments = <RagEmbeddingDocumentModel>[].obs;
  final embeddingSearchResults = <RagEmbeddingSearchResultModel>[].obs;
  final isUploadingEmbedding = false.obs;
  final TextEditingController embeddingContentController = TextEditingController();
  final TextEditingController embeddingSearchController = TextEditingController();

  // Batch upload state
  final batchUploadFiles = <RagUploadFileModel>[].obs;
  final isBatchUploading = false.obs;
  final batchUploadCategory = 'support_app'.obs;
  StreamSubscription<RagUploadFileProgress>? _uploadSubscription;

  @override
  void onInit() {
    super.onInit();
    loadDocuments();
  }

  @override
  void onClose() {
    searchController.dispose();
    titleController.dispose();
    contentController.dispose();
    typeController.dispose();
    embeddingContentController.dispose();
    embeddingSearchController.dispose();
    _uploadSubscription?.cancel();
    super.onClose();
  }

  Future<void> loadDocuments({
    int limit = 20,
    int offset = 0,
    String? typeFilter,
    List<String>? tagFilter,
  }) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.listDocuments(
        limit: limit,
        offset: offset,
        typeFilter: typeFilter,
        tagFilter: tagFilter,
      );

      if (offset == 0) {
        documents.clear();
      }

      for (final proto in response.documents) {
        documents.add(RagDocumentModel.fromProto(proto));
      }
      totalCount.value = response.totalCount;
    } catch (e) {
      error.value = 'rag_error_load_documents'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshDocuments() async {
    await loadDocuments();
  }

  Future<RagDocumentModel?> getDocument(String documentId) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.getDocument(documentId: documentId);
      final document = RagDocumentModel.fromProto(response);
      selectedDocument.value = document;
      return document;
    } catch (e) {
      error.value = 'rag_error_get_document'.tr;
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addDocument({
    required String title,
    required String content,
    required String documentType,
    String? type,
    Map<String, String>? metadata,
    List<String>? tags,
  }) async {
    isLoading.value = true;
    error.value = null;

    try {
      await provider.addDocument(
        title: title,
        content: content,
        documentType: documentType,
        type: type,
        metadata: metadata,
        tags: tags,
      );
      await refreshDocuments();
      return true;
    } catch (e) {
      error.value = 'rag_error_add_document'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addDocumentFromForm() async {
    final title = titleController.text.trim();
    final content = contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      error.value = 'rag_error_required_fields'.tr;
      return false;
    }

    final success = await addDocument(
      title: title,
      content: content,
      documentType: selectedDocumentType.value,
      type: selectedCategory.value,
      tags: selectedTags.isNotEmpty ? selectedTags.toList() : null,
    );

    if (success) {
      clearForm();
    }

    return success;
  }

  Future<bool> deleteDocument(String documentId) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.deleteDocument(documentId: documentId);
      if (response.success) {
        documents.removeWhere((d) => d.documentId == documentId);
        if (selectedDocument.value?.documentId == documentId) {
          selectedDocument.value = null;
        }
        return true;
      }
      return false;
    } catch (e) {
      error.value = 'rag_error_delete_document'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchDocuments({
    required String query,
    int limit = 10,
    double similarityThreshold = 0.7,
    List<String>? tagFilter,
  }) async {
    if (query.trim().isEmpty) {
      searchResults.clear();
      return;
    }

    isSearching.value = true;
    error.value = null;

    try {
      final response = await provider.searchDocuments(
        query: query,
        limit: limit,
        similarityThreshold: similarityThreshold,
        tagFilter: tagFilter,
      );

      searchResults.clear();
      for (final proto in response.results) {
        searchResults.add(RagSearchResultModel.fromProto(proto));
      }
    } catch (e) {
      error.value = 'rag_error_search'.tr;
    } finally {
      isSearching.value = false;
    }
  }

  Future<void> searchFromController() async {
    await searchDocuments(query: searchController.text);
  }

  void clearSearch() {
    searchController.clear();
    searchResults.clear();
  }

  void clearForm() {
    titleController.clear();
    contentController.clear();
    typeController.clear();
    selectedDocumentType.value = 'text';
    selectedCategory.value = 'support_app';
    selectedTags.clear();
  }

  void selectDocument(RagDocumentModel document) {
    selectedDocument.value = document;
  }

  void clearSelectedDocument() {
    selectedDocument.value = null;
  }

  void addTag(String tag) {
    if (!selectedTags.contains(tag)) {
      selectedTags.add(tag);
    }
  }

  void removeTag(String tag) {
    selectedTags.remove(tag);
  }

  // ============================================================================
  // EmbeddingDocument methods
  // ============================================================================

  Future<bool> addEmbeddingDocument({
    required String content,
    Map<String, String>? metadata,
  }) async {
    if (content.trim().isEmpty) {
      error.value = 'rag_embedding_error_content_required'.tr;
      return false;
    }

    isUploadingEmbedding.value = true;
    error.value = null;

    try {
      final response = await provider.addEmbeddingDocument(
        content: content,
        metadata: metadata,
      );

      if (response.documentId > 0) {
        return true;
      }
      return false;
    } catch (e) {
      error.value = 'rag_embedding_error_add'.tr;
      return false;
    } finally {
      isUploadingEmbedding.value = false;
    }
  }

  Future<bool> addEmbeddingDocumentFromForm() async {
    final content = embeddingContentController.text.trim();

    if (content.isEmpty) {
      error.value = 'rag_embedding_error_content_required'.tr;
      return false;
    }

    final success = await addEmbeddingDocument(content: content);

    if (success) {
      clearEmbeddingForm();
    }

    return success;
  }

  Future<bool> deleteEmbeddingDocument(int documentId) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.deleteEmbeddingDocument(
        documentId: documentId,
      );

      if (response.success) {
        embeddingDocuments.removeWhere((d) => d.id == documentId);
        embeddingSearchResults.removeWhere((d) => d.id == documentId);
        return true;
      }
      return false;
    } catch (e) {
      error.value = 'rag_embedding_error_delete'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchEmbeddingDocuments({
    required String query,
    int limit = 5,
    Map<String, String>? filter,
  }) async {
    if (query.trim().isEmpty) {
      embeddingSearchResults.clear();
      return;
    }

    isSearching.value = true;
    error.value = null;

    try {
      final response = await provider.searchEmbeddingDocuments(
        query: query,
        limit: limit,
        filter: filter,
      );

      embeddingSearchResults.clear();
      for (final proto in response.results) {
        embeddingSearchResults.add(RagEmbeddingSearchResultModel.fromProto(proto));
      }
    } catch (e) {
      error.value = 'rag_embedding_error_search'.tr;
    } finally {
      isSearching.value = false;
    }
  }

  Future<void> searchEmbeddingFromController() async {
    await searchEmbeddingDocuments(query: embeddingSearchController.text);
  }

  void clearEmbeddingSearch() {
    embeddingSearchController.clear();
    embeddingSearchResults.clear();
  }

  void clearEmbeddingForm() {
    embeddingContentController.clear();
  }

  // ============================================================================
  // Batch File Upload methods
  // ============================================================================

  /// Adds files to the batch upload queue
  void addFilesToBatch(List<RagUploadFileModel> files) {
    batchUploadFiles.addAll(files);
  }

  /// Removes a file from the batch upload queue by index
  void removeFileFromBatch(int index) {
    if (index >= 0 && index < batchUploadFiles.length) {
      batchUploadFiles.removeAt(index);
    }
  }

  /// Clears all files from the batch upload queue
  void clearBatchUpload() {
    batchUploadFiles.clear();
    isBatchUploading.value = false;
    batchUploadCategory.value = 'support_app';
    error.value = null;
  }

  /// Gets the current batch upload summary
  RagBatchUploadSummary get batchUploadSummary {
    final total = batchUploadFiles.length;
    final completed = batchUploadFiles
        .where((f) => f.status == RagFileUploadStatus.completed)
        .length;
    final failed = batchUploadFiles
        .where((f) => f.status == RagFileUploadStatus.failed)
        .length;
    final pending = batchUploadFiles
        .where((f) => !f.isTerminal)
        .length;

    return RagBatchUploadSummary(
      totalFiles: total,
      completedFiles: completed,
      failedFiles: failed,
      pendingFiles: pending,
    );
  }

  /// Starts the batch upload process
  Future<void> startBatchUpload() async {
    if (batchUploadFiles.isEmpty) {
      error.value = 'rag_batch_no_files'.tr;
      return;
    }

    if (isBatchUploading.value) {
      return;
    }

    isBatchUploading.value = true;
    error.value = null;

    try {
      // Create upload file objects for gRPC
      final uploadFiles = batchUploadFiles.map((file) {
        return provider.createUploadFile(
          fileName: file.fileName,
          content: file.content,
          documentType: file.documentType,
          type: batchUploadCategory.value,
        );
      }).toList();

      // Subscribe to the upload progress stream
      final stream = provider.uploadFilesBatch(files: uploadFiles);

      await for (final progress in stream) {
        _handleUploadProgress(progress);
      }

      // Refresh documents list after successful uploads
      await refreshDocuments();
    } catch (e) {
      error.value = 'rag_batch_error'.tr;
    } finally {
      isBatchUploading.value = false;
    }
  }

  /// Handles progress updates from the server
  void _handleUploadProgress(RagUploadFileProgress progress) {
    final index = progress.fileIndex;
    if (index < 0 || index >= batchUploadFiles.length) return;

    final currentFile = batchUploadFiles[index];

    // Map proto status to model status
    RagFileUploadStatus status;
    switch (progress.status) {
      case RagUploadStatus.UPLOAD_STATUS_RECEIVED:
        status = RagFileUploadStatus.received;
        break;
      case RagUploadStatus.UPLOAD_STATUS_PROCESSING:
        status = RagFileUploadStatus.processing;
        break;
      case RagUploadStatus.UPLOAD_STATUS_COMPLETED:
        status = RagFileUploadStatus.completed;
        break;
      case RagUploadStatus.UPLOAD_STATUS_FAILED:
        status = RagFileUploadStatus.failed;
        break;
      default:
        status = RagFileUploadStatus.pending;
    }

    // Update the file in the list
    batchUploadFiles[index] = currentFile.copyWith(
      status: status,
      statusMessage: progress.message,
      documentId: progress.documentId > 0 ? progress.documentId.toInt() : null,
      error: progress.error.isNotEmpty ? progress.error : null,
    );
  }

  /// Cancels the ongoing batch upload
  void cancelBatchUpload() {
    _uploadSubscription?.cancel();
    _uploadSubscription = null;
    isBatchUploading.value = false;
  }

  /// Retries failed uploads
  Future<void> retryFailedUploads() async {
    // Get failed files
    final failedFiles = batchUploadFiles
        .where((f) => f.status == RagFileUploadStatus.failed)
        .toList();

    if (failedFiles.isEmpty) return;

    // Reset their status to pending
    for (var i = 0; i < batchUploadFiles.length; i++) {
      if (batchUploadFiles[i].status == RagFileUploadStatus.failed) {
        batchUploadFiles[i] = batchUploadFiles[i].copyWith(
          status: RagFileUploadStatus.pending,
          error: null,
          statusMessage: null,
        );
      }
    }

    // Remove completed files and restart upload
    batchUploadFiles.removeWhere(
        (f) => f.status == RagFileUploadStatus.completed);

    if (batchUploadFiles.isNotEmpty) {
      await startBatchUpload();
    }
  }
}
