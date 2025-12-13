import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/rag/rag_module.dart';

/// RAG content widget for admin layout
class RagContent extends StatefulWidget {
  const RagContent({super.key});

  @override
  State<RagContent> createState() => _RagContentState();
}

class _RagContentState extends State<RagContent> {
  RagController? _controller;
  RagProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const String _tag = 'admin_rag';

  @override
  void initState() {
    super.initState();
    _initializeRag();
  }

  Future<void> _initializeRag() async {
    try {
      _provider = RagProvider(channelFactory: RagEnvironment.channelFactory);
      _controller = RagController(provider: _provider!);

      Get.put<RagController>(_controller!, tag: _tag);

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _initError = e.toString();
      });
    }
  }

  @override
  void dispose() {
    Get.delete<RagController>(tag: _tag);
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return _buildErrorState();
    }

    if (!_isInitialized) {
      return _buildLoadingState();
    }

    return _buildRagContent();
  }

  Widget _buildErrorState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: colorScheme.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Erro ao inicializar o RAG',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _initError!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  _initError = null;
                });
                _initializeRag();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Conectando ao servidor RAG...',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRagContent() {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildDocumentsList()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _controller!.searchController,
                decoration: InputDecoration(
                  hintText: 'rag_search_placeholder'.tr,
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onSubmitted: (_) => _controller!.searchFromController(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          FilledButton.icon(
            onPressed: () => _showAddDocumentDialog(),
            icon: const Icon(Icons.add, size: 20),
            label: const Text('Adicionar'),
          ),
          const SizedBox(width: 8),
          IconButton.outlined(
            onPressed: _controller!.refreshDocuments,
            icon: const Icon(Icons.refresh),
            tooltip: 'rag_refresh'.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentsList() {
    return Obx(() {
      if (_controller!.isLoading.value && _controller!.documents.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      if (_controller!.error.value != null && _controller!.documents.isEmpty) {
        return _buildErrorCard();
      }

      if (_controller!.documents.isEmpty) {
        return _buildEmptyState();
      }

      return RefreshIndicator(
        onRefresh: _controller!.refreshDocuments,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _controller!.documents.length,
          itemBuilder: (context, index) {
            final document = _controller!.documents[index];
            return _buildDocumentCard(document);
          },
        ),
      );
    });
  }

  Widget _buildErrorCard() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(_controller!.error.value!),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _controller!.refreshDocuments,
            child: Text('rag_refresh'.tr),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.folder_open,
              size: 40,
              color: colorScheme.primary.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'rag_no_documents'.tr,
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => _showAddDocumentDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Adicionar documento'),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(RagDocumentModel document) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: InkWell(
        onTap: () {
          _controller!.selectDocument(document);
          _showDocumentDetailDialog(document);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getDocumentTypeColor(document.documentType)
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getDocumentTypeIcon(document.documentType),
                  color: _getDocumentTypeColor(document.documentType),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildInfoChip(
                          Icons.layers_outlined,
                          '${document.chunkCount} chunks',
                        ),
                        const SizedBox(width: 12),
                        _buildInfoChip(
                          Icons.description_outlined,
                          document.documentTypeLabel,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => _showDeleteConfirm(document),
                icon: Icon(
                  Icons.delete_outline,
                  color: colorScheme.error.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Color _getDocumentTypeColor(String type) {
    switch (type) {
      case 'pdf_text':
        return Colors.red;
      case 'markdown':
        return Colors.blue;
      case 'html':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getDocumentTypeIcon(String type) {
    switch (type) {
      case 'pdf_text':
        return Icons.picture_as_pdf;
      case 'markdown':
        return Icons.description;
      case 'html':
        return Icons.code;
      default:
        return Icons.article;
    }
  }

  void _showAddDocumentDialog() {
    showDialog(
      context: context,
      builder: (context) => _AddDocumentDialog(controller: _controller!),
    );
  }

  void _showDocumentDetailDialog(RagDocumentModel document) {
    showDialog(
      context: context,
      builder: (context) => _DocumentDetailDialog(
        document: document,
        onDelete: () => _showDeleteConfirm(document),
      ),
    );
  }

  void _showDeleteConfirm(RagDocumentModel document) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('rag_delete'.tr),
        content: Text('rag_delete_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('rag_cancel'.tr),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              _controller!.deleteDocument(document.documentId);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('rag_delete'.tr),
          ),
        ],
      ),
    );
  }
}

class _AddDocumentDialog extends StatelessWidget {
  final RagController controller;

  const _AddDocumentDialog({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  'rag_add_document'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: 'rag_document_title'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => DropdownButtonFormField<String>(
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
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.contentController,
              decoration: InputDecoration(
                labelText: 'rag_document_content'.tr,
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 8,
            ),
            const SizedBox(height: 24),
            Obx(
              () => controller.error.value != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        controller.error.value!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('rag_cancel'.tr),
                ),
                const SizedBox(width: 12),
                Obx(
                  () => FilledButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            final success =
                                await controller.addDocumentFromForm();
                            if (success && context.mounted) {
                              Navigator.pop(context);
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DocumentDetailDialog extends StatelessWidget {
  final RagDocumentModel document;
  final VoidCallback onDelete;

  const _DocumentDetailDialog({
    required this.document,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'rag_view_details'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onDelete();
                  },
                  icon: Icon(Icons.delete_outline, color: colorScheme.error),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildInfoRow('rag_document_title'.tr, document.title),
            _buildInfoRow('rag_document_type'.tr, document.documentTypeLabel),
            _buildInfoRow('rag_document_chunks'.tr, document.chunkCount.toString()),
            _buildInfoRow('rag_document_created'.tr, _formatDate(document.createdAt)),
            _buildInfoRow('rag_document_updated'.tr, _formatDate(document.updatedAt)),
            if (document.tags.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'rag_document_tags'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
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
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
