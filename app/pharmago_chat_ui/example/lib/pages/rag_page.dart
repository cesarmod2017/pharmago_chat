import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/rag/rag_module.dart';

class RagPage extends StatefulWidget {
  const RagPage({super.key});

  @override
  State<RagPage> createState() => _RagPageState();
}

class _RagPageState extends State<RagPage> {
  RagController? _controller;
  RagProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const bool _useDemoMode = false;

  @override
  void initState() {
    super.initState();
    _initializeRag();
  }

  Future<void> _initializeRag() async {
    try {
      if (_useDemoMode) {
        _controller = _MockRagController();
      } else {
        _provider = RagProvider(channelFactory: RagEnvironment.channelFactory);
        _controller = RagController(provider: _provider!);
      }

      Get.put<RagController>(_controller!, tag: 'rag_page');

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
    Get.delete<RagController>(tag: 'rag_page');
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Base de Conhecimento'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Erro ao inicializar o RAG',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  _initError!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _initError = null;
                    });
                    _initializeRag();
                  },
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (!_isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Base de Conhecimento'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Conectando ao servidor RAG...'),
            ],
          ),
        ),
      );
    }

    return _RagPageWrapper(
      controller: _controller!,
      onBackPressed: () => Navigator.of(context).pop(),
    );
  }
}

class _RagPageWrapper extends StatelessWidget {
  final RagController controller;
  final VoidCallback onBackPressed;

  const _RagPageWrapper({
    required this.controller,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_title'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _navigateToSearch(context),
            tooltip: 'rag_search'.tr,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshDocuments,
            tooltip: 'rag_refresh'.tr,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddDocument(context),
        tooltip: 'rag_add_document'.tr,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          _buildEnvironmentInfo(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.documents.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.error.value != null &&
                  controller.documents.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.red,
                      ),
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
                      const Icon(
                        Icons.folder_open,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'rag_no_documents'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
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
                        _navigateToDocumentDetail(context);
                      },
                      onDelete: () => _showDeleteConfirm(context, document),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildEnvironmentInfo() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.library_books, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${RagEnvironment.host}:${RagEnvironment.port}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _RagSearchWrapper(
          controller: controller,
          onBackPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  void _navigateToAddDocument(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _RagAddDocumentWrapper(
          controller: controller,
          onBackPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  void _navigateToDocumentDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _RagDocumentDetailWrapper(
          controller: controller,
          onBackPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  void _showDeleteConfirm(BuildContext context, RagDocumentModel document) {
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

class _RagSearchWrapper extends StatelessWidget {
  final RagController controller;
  final VoidCallback onBackPressed;

  const _RagSearchWrapper({
    required this.controller,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_search'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
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
                suffixIcon: Obx(
                  () => controller.searchResults.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: controller.clearSearch,
                        )
                      : const SizedBox.shrink(),
                ),
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

class _RagDocumentDetailWrapper extends StatelessWidget {
  final RagController controller;
  final VoidCallback onBackPressed;

  const _RagDocumentDetailWrapper({
    required this.controller,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_view_details'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
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
        Text(content, style: const TextStyle(fontSize: 16)),
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
      builder: (dialogContext) => AlertDialog(
        title: Text('rag_delete'.tr),
        content: Text('rag_delete_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('rag_cancel'.tr),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              final success = await controller.deleteDocument(
                document.documentId,
              );
              if (success && context.mounted) {
                onBackPressed();
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

class _RagAddDocumentWrapper extends StatelessWidget {
  final RagController controller;
  final VoidCallback onBackPressed;

  const _RagAddDocumentWrapper({
    required this.controller,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rag_add_document'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
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
            Obx(
              () => DropdownButtonFormField<String>(
                initialValue: controller.selectedDocumentType.value,
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
              maxLines: 10,
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
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        final success = await controller.addDocumentFromForm();
                        if (success && context.mounted) {
                          onBackPressed();
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
      ),
    );
  }
}

class _MockRagController extends RagController {
  _MockRagController() : super(provider: _MockRagProvider());

  @override
  void onInit() {
    super.onInit();
    documents.addAll([
      RagDocumentModel(
        documentId: 'doc-1',
        title: 'Manual de Medicamentos',
        documentType: 'markdown',
        chunkCount: 25,
        tags: ['medicamentos', 'manual'],
        metadata: {},
        type: '',
        contentLength: 15000,
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      RagDocumentModel(
        documentId: 'doc-2',
        title: 'Politica de Devolucao',
        documentType: 'pdf_text',
        chunkCount: 10,
        type: '',
        tags: ['politica', 'devolucao'],
        metadata: {},
        contentLength: 8000,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      RagDocumentModel(
        documentId: 'doc-3',
        title: 'FAQ - Perguntas Frequentes',
        documentType: 'html',
        chunkCount: 50,
        type: '',
        tags: ['faq', 'ajuda'],
        metadata: {},
        contentLength: 25000,
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ]);
  }

  @override
  Future<void> refreshDocuments() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading.value = false;
  }

  @override
  Future<void> searchFromController() async {
    final query = searchController.text.trim();
    if (query.isEmpty) return;

    isSearching.value = true;
    await Future.delayed(const Duration(milliseconds: 800));

    searchResults.clear();
    searchResults.addAll([
      RagSearchResultModel(
        documentId: 'doc-1',
        chunkId: 'chunk-1',
        title: 'Manual de Medicamentos',
        content:
            'Este documento contem informacoes sobre medicamentos controlados e suas indicacoes de uso...',
        similarityScore: 0.92,
        metadata: {},
      ),
      RagSearchResultModel(
        documentId: 'doc-3',
        chunkId: 'chunk-5',
        title: 'FAQ - Perguntas Frequentes',
        content:
            'Pergunta: Como posso consultar o estoque de medicamentos? Resposta: Voce pode usar...',
        similarityScore: 0.78,
        metadata: {},
      ),
    ]);

    isSearching.value = false;
  }

  @override
  Future<bool> deleteDocument(String documentId) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    documents.removeWhere((doc) => doc.documentId == documentId);
    isLoading.value = false;
    return true;
  }

  @override
  Future<bool> addDocumentFromForm() async {
    final title = titleController.text.trim();
    final content = contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      error.value = 'Titulo e conteudo sao obrigatorios';
      return false;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 800));

    documents.add(
      RagDocumentModel(
        documentId: 'doc-${DateTime.now().millisecondsSinceEpoch}',
        title: title,
        type: '',
        documentType: selectedDocumentType.value,
        chunkCount: (content.length / 100).ceil(),
        tags: [],
        metadata: {},
        contentLength: content.length,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    titleController.clear();
    contentController.clear();
    selectedDocumentType.value = 'text';
    isLoading.value = false;
    return true;
  }
}

class _MockRagProvider extends RagProvider {
  _MockRagProvider() : super(channelFactory: _mockChannelFactory);

  static Future<Never> _mockChannelFactory() async {
    throw UnimplementedError('Mock provider does not use real gRPC channel');
  }
}
