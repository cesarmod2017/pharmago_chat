import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/rag_controller.dart';
import '../models/rag_document_model.dart';
import '../routes/rag_routes.dart';

class RagPage extends GetView<RagController> {
  const RagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_title'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.toNamed('/rag/search'),
            tooltip: 'rag_search'.tr,
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.auto_awesome),
            tooltip: 'rag_embedding_title'.tr,
            onSelected: (value) {
              switch (value) {
                case 'add_embedding':
                  Get.toNamed(RagRoutes.ragEmbeddingAdd);
                  break;
                case 'search_embedding':
                  Get.toNamed(RagRoutes.ragEmbeddingSearch);
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'add_embedding',
                child: Row(
                  children: [
                    const Icon(Icons.upload),
                    const SizedBox(width: 8),
                    Text('rag_embedding_add'.tr),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'search_embedding',
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 8),
                    Text('rag_embedding_search'.tr),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshDocuments,
            tooltip: 'rag_refresh'.tr,
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'batch_upload',
            onPressed: () => Get.toNamed(RagRoutes.ragBatchUpload),
            tooltip: 'rag_batch_upload'.tr,
            child: const Icon(Icons.upload_file),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'add_document',
            onPressed: () => Get.toNamed('/rag/add'),
            tooltip: 'rag_add_document'.tr,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.documents.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value != null && controller.documents.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(controller.error.value!),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.refreshDocuments,
                  child: Text('rag_refresh'.tr),
                ),
              ],
            ),
          );
        }

        if (controller.documents.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.folder_open, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'rag_no_documents'.tr,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshDocuments,
          child: ListView.builder(
            itemCount: controller.documents.length,
            itemBuilder: (context, index) {
              final document = controller.documents[index];
              return RagDocumentListTile(
                document: document,
                onTap: () {
                  controller.selectDocument(document);
                  Get.toNamed('/rag/document');
                },
                onDelete: () => _showDeleteConfirm(context, document),
              );
            },
          ),
        );
      }),
    );
  }

  void _showDeleteConfirm(BuildContext context, RagDocumentModel document) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('rag_delete'.tr),
        content: Text('rag_delete_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('rag_cancel'.tr),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              controller.deleteDocument(document.documentId);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('rag_delete'.tr),
          ),
        ],
      ),
    );
  }
}

class RagDocumentListTile extends StatelessWidget {
  final RagDocumentModel document;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const RagDocumentListTile({
    super.key,
    required this.document,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: _getDocumentIcon(),
        title: Text(
          document.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${document.documentTypeLabel} - ${document.chunkCount} ${'rag_document_chunks'.tr.toLowerCase()}${document.type.isNotEmpty ? ' - ${document.type}' : ''}',
              style: const TextStyle(fontSize: 12),
            ),
            if (document.tags.isNotEmpty)
              Wrap(
                spacing: 4,
                children: document.tags
                    .take(3)
                    .map((tag) => Chip(
                          label: Text(tag),
                          labelStyle: const TextStyle(fontSize: 10),
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ))
                    .toList(),
              ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete,
          color: Colors.red,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _getDocumentIcon() {
    IconData icon;
    Color color;

    switch (document.documentType.toLowerCase()) {
      case 'markdown':
        icon = Icons.code;
        color = Colors.blue;
        break;
      case 'pdf_text':
        icon = Icons.picture_as_pdf;
        color = Colors.red;
        break;
      case 'html':
        icon = Icons.html;
        color = Colors.orange;
        break;
      default:
        icon = Icons.description;
        color = Colors.grey;
    }

    return CircleAvatar(
      backgroundColor: color.withValues(alpha: 0.1),
      child: Icon(icon, color: color),
    );
  }
}

class RagSearchPage extends GetView<RagController> {
  const RagSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_search'.tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'rag_search_placeholder'.tr,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Obx(() => controller.searchResults.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: controller.clearSearch,
                      )
                    : const SizedBox.shrink()),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => controller.searchFromController(),
            ),
          ),
          Obx(() {
            if (controller.isSearching.value) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (controller.searchResults.isEmpty) {
              return Expanded(
                child: Center(
                  child: Text(
                    'rag_no_results'.tr,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }

            return Expanded(
              child: ListView.builder(
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  final result = controller.searchResults[index];
                  return RagSearchResultTile(result: result);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class RagSearchResultTile extends StatelessWidget {
  final RagSearchResultModel result;

  const RagSearchResultTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    result.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Chip(
                  label: Text('${result.similarityPercent}%'),
                  backgroundColor: _getSimilarityColor(result.similarityScore),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              result.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Color _getSimilarityColor(double score) {
    if (score >= 0.9) return Colors.green;
    if (score >= 0.7) return Colors.orange;
    return Colors.red;
  }
}

class RagDocumentDetailPage extends GetView<RagController> {
  const RagDocumentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_view_details'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDeleteConfirm(context),
            color: Colors.red,
          ),
        ],
      ),
      body: Obx(() {
        final document = controller.selectedDocument.value;
        if (document == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard(
                title: 'rag_document_title'.tr,
                content: document.title,
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'rag_document_type'.tr,
                content: document.documentTypeLabel,
              ),
              if (document.type.isNotEmpty) ...[
                const SizedBox(height: 16),
                _buildInfoCard(
                  title: 'rag_document_type_filter'.tr,
                  content: document.type,
                ),
              ],
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'rag_document_chunks'.tr,
                content: document.chunkCount.toString(),
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'rag_document_created'.tr,
                content: _formatDate(document.createdAt),
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'rag_document_updated'.tr,
                content: _formatDate(document.updatedAt),
              ),
              if (document.tags.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'rag_document_tags'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: document.tags
                      .map((tag) => Chip(label: Text(tag)))
                      .toList(),
                ),
              ],
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _showDeleteConfirm(BuildContext context) {
    final document = controller.selectedDocument.value;
    if (document == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('rag_delete'.tr),
        content: Text('rag_delete_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('rag_cancel'.tr),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success =
                  await controller.deleteDocument(document.documentId);
              if (success) {
                Get.back();
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('rag_delete'.tr),
          ),
        ],
      ),
    );
  }
}

class RagAddDocumentPage extends GetView<RagController> {
  const RagAddDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_add_document'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: 'rag_document_title'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Obx(() => DropdownButtonFormField<String>(
                        value: controller.selectedDocumentType.value,
                        decoration: InputDecoration(
                          labelText: 'rag_document_type'.tr,
                          border: const OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'text', child: Text('Texto')),
                          DropdownMenuItem(value: 'markdown', child: Text('Markdown')),
                          DropdownMenuItem(value: 'pdf_text', child: Text('PDF')),
                          DropdownMenuItem(value: 'html', child: Text('HTML')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedDocumentType.value = value;
                          }
                        },
                      )),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: controller.typeController,
                    decoration: InputDecoration(
                      labelText: 'rag_document_type_filter'.tr,
                      hintText: 'rag_type_hint'.tr,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.contentController,
              decoration: InputDecoration(
                labelText: 'rag_document_content'.tr,
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 10,
            ),
            const SizedBox(height: 24),
            Obx(() => controller.error.value != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      controller.error.value!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox.shrink()),
            Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          final success =
                              await controller.addDocumentFromForm();
                          if (success) {
                            Get.back();
                            Get.snackbar(
                              'rag_title'.tr,
                              'rag_add_success'.tr,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                  child: controller.isLoading.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text('rag_save'.tr),
                )),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// EmbeddingDocument Pages
// ============================================================================

class RagAddEmbeddingDocumentPage extends GetView<RagController> {
  const RagAddEmbeddingDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_embedding_add'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'rag_embedding_content_hint'.tr,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.embeddingContentController,
              decoration: InputDecoration(
                labelText: 'rag_embedding_content'.tr,
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 15,
              minLines: 10,
            ),
            const SizedBox(height: 24),
            Obx(() => controller.error.value != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      controller.error.value!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox.shrink()),
            Obx(() => ElevatedButton.icon(
                  onPressed: controller.isUploadingEmbedding.value
                      ? null
                      : () async {
                          final success =
                              await controller.addEmbeddingDocumentFromForm();
                          if (success) {
                            Get.back();
                            Get.snackbar(
                              'rag_embedding_title'.tr,
                              'rag_embedding_add_success'.tr,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                  icon: controller.isUploadingEmbedding.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.upload),
                  label: Text('rag_embedding_upload'.tr),
                )),
          ],
        ),
      ),
    );
  }
}

class RagEmbeddingSearchPage extends GetView<RagController> {
  const RagEmbeddingSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_embedding_search'.tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller.embeddingSearchController,
              decoration: InputDecoration(
                hintText: 'rag_embedding_search_placeholder'.tr,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Obx(() => controller.embeddingSearchResults.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: controller.clearEmbeddingSearch,
                      )
                    : const SizedBox.shrink()),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => controller.searchEmbeddingFromController(),
            ),
          ),
          Obx(() {
            if (controller.isSearching.value) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (controller.embeddingSearchResults.isEmpty) {
              return Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search_off,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'rag_embedding_no_results'.tr,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Expanded(
              child: ListView.builder(
                itemCount: controller.embeddingSearchResults.length,
                itemBuilder: (context, index) {
                  final result = controller.embeddingSearchResults[index];
                  return RagEmbeddingSearchResultTile(
                    result: result,
                    onDelete: () => _showDeleteConfirm(context, result.id),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  void _showDeleteConfirm(BuildContext context, int documentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('rag_delete'.tr),
        content: Text('rag_embedding_delete_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('rag_cancel'.tr),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await controller.deleteEmbeddingDocument(documentId);
              if (success) {
                Get.snackbar(
                  'rag_embedding_title'.tr,
                  'rag_embedding_delete_success'.tr,
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('rag_delete'.tr),
          ),
        ],
      ),
    );
  }
}

class RagEmbeddingSearchResultTile extends StatelessWidget {
  final RagEmbeddingSearchResultModel result;
  final VoidCallback? onDelete;

  const RagEmbeddingSearchResultTile({
    super.key,
    required this.result,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(
                  label: Text('ID: ${result.id}'),
                  backgroundColor: Colors.grey.shade200,
                ),
                const Spacer(),
                Chip(
                  label: Text('${result.similarityPercent}%'),
                  backgroundColor: _getSimilarityColor(result.similarityScore),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.red,
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              result.contentPreview,
              style: const TextStyle(fontSize: 14),
            ),
            if (result.metadata.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Divider(),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: result.metadata.entries
                    .take(3)
                    .map((e) => Chip(
                          label: Text('${e.key}: ${e.value}'),
                          labelStyle: const TextStyle(fontSize: 10),
                          padding: EdgeInsets.zero,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getSimilarityColor(double score) {
    if (score >= 0.9) return Colors.green;
    if (score >= 0.7) return Colors.orange;
    return Colors.red;
  }
}

// ============================================================================
// Batch Upload Page
// ============================================================================

class RagBatchUploadPage extends GetView<RagController> {
  const RagBatchUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_batch_upload'.tr),
        actions: [
          Obx(() => controller.batchUploadFiles.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  onPressed: controller.clearBatchUpload,
                  tooltip: 'rag_batch_clear'.tr,
                )
              : const SizedBox.shrink()),
        ],
      ),
      body: Column(
        children: [
          // Info card
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'rag_batch_info'.tr,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Type field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) => controller.batchUploadType.value = value,
              decoration: InputDecoration(
                labelText: 'rag_document_type_filter'.tr,
                hintText: 'rag_type_hint'.tr,
                prefixIcon: const Icon(Icons.category_outlined),
                border: const OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // File picker button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() => ElevatedButton.icon(
                  onPressed: controller.isBatchUploading.value
                      ? null
                      : () => _pickFiles(context),
                  icon: const Icon(Icons.folder_open),
                  label: Text('rag_batch_select_files'.tr),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                )),
          ),

          const SizedBox(height: 16),

          // Progress summary
          Obx(() {
            if (controller.batchUploadFiles.isEmpty) {
              return const SizedBox.shrink();
            }

            final summary = controller.batchUploadSummary;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: summary.progressPercent,
                    backgroundColor: Colors.grey.shade200,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${'rag_batch_total'.tr}: ${summary.totalFiles}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${'rag_batch_completed'.tr}: ${summary.completedFiles}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                      if (summary.hasErrors)
                        Text(
                          '${'rag_batch_failed'.tr}: ${summary.failedFiles}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 8),

          // File list
          Expanded(
            child: Obx(() {
              if (controller.batchUploadFiles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'rag_batch_no_files'.tr,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'rag_batch_supported_formats'.tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.batchUploadFiles.length,
                itemBuilder: (context, index) {
                  final file = controller.batchUploadFiles[index];
                  return _BatchUploadFileCard(
                    file: file,
                    index: index,
                    onRemove: controller.isBatchUploading.value
                        ? null
                        : () => controller.removeFileFromBatch(index),
                  );
                },
              );
            }),
          ),

          // Error message
          Obx(() {
            if (controller.error.value != null) {
              return Container(
                padding: const EdgeInsets.all(16),
                color: Colors.red.shade50,
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        controller.error.value!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          }),

          // Action buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Obx(() {
                final summary = controller.batchUploadSummary;

                if (summary.isComplete && summary.hasErrors) {
                  return Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            controller.clearBatchUpload();
                            Get.back();
                          },
                          icon: const Icon(Icons.close),
                          label: Text('rag_batch_done'.tr),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: controller.retryFailedUploads,
                          icon: const Icon(Icons.refresh),
                          label: Text('rag_batch_retry'.tr),
                        ),
                      ),
                    ],
                  );
                }

                if (summary.isComplete) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      controller.clearBatchUpload();
                      Get.back();
                      Get.snackbar(
                        'rag_title'.tr,
                        'rag_batch_success'.tr,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: Text('rag_batch_done'.tr),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Colors.green,
                    ),
                  );
                }

                if (controller.isBatchUploading.value) {
                  return ElevatedButton.icon(
                    onPressed: controller.cancelBatchUpload,
                    icon: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                    label: Text('rag_batch_uploading'.tr),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  );
                }

                return ElevatedButton.icon(
                  onPressed: controller.batchUploadFiles.isEmpty
                      ? null
                      : controller.startBatchUpload,
                  icon: const Icon(Icons.cloud_upload),
                  label: Text('rag_batch_start'.tr),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickFiles(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['md', 'txt'],
        allowMultiple: true,
        withData: kIsWeb,
      );

      if (result == null || result.files.isEmpty) return;

      final files = <RagUploadFileModel>[];

      for (final platformFile in result.files) {
        String content;

        if (kIsWeb) {
          // Web: use bytes
          if (platformFile.bytes != null) {
            content = String.fromCharCodes(platformFile.bytes!);
          } else {
            continue;
          }
        } else {
          // Desktop/Mobile: read from file path
          if (platformFile.path != null) {
            content = await File(platformFile.path!).readAsString();
          } else {
            continue;
          }
        }

        final fileName = platformFile.name;
        final documentType = RagUploadFileModel.detectDocumentType(fileName);

        files.add(RagUploadFileModel(
          fileName: fileName,
          content: content,
          fileSize: platformFile.size,
          documentType: documentType,
        ));
      }

      if (files.isNotEmpty) {
        controller.addFilesToBatch(files);
      }
    } catch (e) {
      Get.snackbar(
        'rag_title'.tr,
        'rag_batch_error_pick'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
      );
    }
  }
}

class _BatchUploadFileCard extends StatelessWidget {
  final RagUploadFileModel file;
  final int index;
  final VoidCallback? onRemove;

  const _BatchUploadFileCard({
    required this.file,
    required this.index,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: _buildStatusIcon(),
        title: Text(
          file.fileName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  file.documentTypeLabel,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 8),
                Text(
                  file.fileSizeFormatted,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            if (file.statusMessage != null)
              Text(
                file.statusMessage!,
                style: TextStyle(
                  fontSize: 11,
                  color: _getStatusColor(),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (file.error != null)
              Text(
                file.error!,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.red,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        trailing: onRemove != null
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: onRemove,
                color: Colors.grey,
              )
            : null,
      ),
    );
  }

  Widget _buildStatusIcon() {
    switch (file.status) {
      case RagFileUploadStatus.pending:
        return CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.schedule,
            color: Colors.grey.shade600,
          ),
        );
      case RagFileUploadStatus.received:
        return CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: const Icon(
            Icons.download_done,
            color: Colors.blue,
          ),
        );
      case RagFileUploadStatus.processing:
        return CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.orange,
            ),
          ),
        );
      case RagFileUploadStatus.completed:
        return CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        );
      case RagFileUploadStatus.failed:
        return CircleAvatar(
          backgroundColor: Colors.red.shade100,
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
    }
  }

  Color _getStatusColor() {
    switch (file.status) {
      case RagFileUploadStatus.pending:
        return Colors.grey;
      case RagFileUploadStatus.received:
        return Colors.blue;
      case RagFileUploadStatus.processing:
        return Colors.orange;
      case RagFileUploadStatus.completed:
        return Colors.green;
      case RagFileUploadStatus.failed:
        return Colors.red;
    }
  }
}
