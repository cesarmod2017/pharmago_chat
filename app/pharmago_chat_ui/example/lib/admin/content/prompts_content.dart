import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/prompts/prompts_module.dart';

/// Prompts content widget for admin layout
class PromptsContent extends StatefulWidget {
  const PromptsContent({super.key});

  @override
  State<PromptsContent> createState() => _PromptsContentState();
}

class _PromptsContentState extends State<PromptsContent> {
  PromptsController? _controller;
  PromptsProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const String _tag = 'admin_prompts';

  // Local search query
  final _searchQuery = ''.obs;

  @override
  void initState() {
    super.initState();
    _initializePrompts();
  }

  Future<void> _initializePrompts() async {
    try {
      _provider = PromptsProvider(
        channelFactory: PromptsEnvironment.channelFactory,
      );
      _controller = PromptsController(provider: _provider!);

      Get.put<PromptsController>(_controller!, tag: _tag);

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
    Get.delete<PromptsController>(tag: _tag);
    _provider?.dispose();
    super.dispose();
  }

  List<PromptModel> get _filteredPrompts {
    if (_searchQuery.value.isEmpty) {
      return _controller!.prompts.toList();
    }
    final query = _searchQuery.value.toLowerCase();
    return _controller!.prompts.where((p) {
      return p.name.toLowerCase().contains(query) ||
          p.type.toLowerCase().contains(query) ||
          p.prompt.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return _buildErrorState();
    }

    if (!_isInitialized) {
      return _buildLoadingState();
    }

    return _buildPromptsContent();
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
              'Erro ao inicializar Prompts',
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
                _initializePrompts();
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
            'Conectando ao servidor de Prompts...',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromptsContent() {
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
          Expanded(child: _buildPromptsList()),
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
          bottom: BorderSide(color: colorScheme.outline.withValues(alpha: 0.1)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'prompts_search'.tr,
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
                onChanged: (value) {
                  _searchQuery.value = value;
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          FilledButton.icon(
            onPressed: () => _showAddPromptDialog(),
            icon: const Icon(Icons.add, size: 20),
            label: const Text('Novo Prompt'),
          ),
          const SizedBox(width: 8),
          IconButton.outlined(
            onPressed: _controller!.refreshPrompts,
            icon: const Icon(Icons.refresh),
            tooltip: 'prompts_refresh'.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildPromptsList() {
    return Obx(() {
      // Force rebuild when search query changes
      _searchQuery.value;

      if (_controller!.isLoading.value && _controller!.prompts.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      if (_controller!.error.value != null && _controller!.prompts.isEmpty) {
        return _buildErrorCard();
      }

      final filteredPrompts = _filteredPrompts;

      if (filteredPrompts.isEmpty) {
        return _buildEmptyState();
      }

      return RefreshIndicator(
        onRefresh: _controller!.refreshPrompts,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filteredPrompts.length,
          itemBuilder: (context, index) {
            final prompt = filteredPrompts[index];
            return _buildPromptCard(prompt);
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
          Icon(Icons.error_outline, size: 48, color: colorScheme.error),
          const SizedBox(height: 16),
          Text(_controller!.error.value!),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _controller!.refreshPrompts,
            child: Text('prompts_refresh'.tr),
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
              Icons.text_snippet_outlined,
              size: 40,
              color: colorScheme.primary.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'prompts_empty'.tr,
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => _showAddPromptDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Criar prompt'),
          ),
        ],
      ),
    );
  }

  Widget _buildPromptCard(PromptModel prompt) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: InkWell(
        onTap: () => _showEditPromptDialog(prompt),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getTypeColor(prompt.type).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getTypeIcon(prompt.type),
                  color: _getTypeColor(prompt.type),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            prompt.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _getTypeColor(
                              prompt.type,
                            ).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            prompt.typeLabel,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _getTypeColor(prompt.type),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      prompt.promptPreview,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoChip(Icons.category_outlined, prompt.type),
                        const SizedBox(width: 12),
                        _buildInfoChip(
                          Icons.calendar_today_outlined,
                          _formatDate(prompt.updatedAt),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<String>(
                onSelected: (value) => _handlePromptAction(value, prompt),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: colorScheme.onSurface,
                        ),
                        const SizedBox(width: 8),
                        const Text('Editar'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          size: 18,
                          color: colorScheme.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Excluir',
                          style: TextStyle(color: colorScheme.error),
                        ),
                      ],
                    ),
                  ),
                ],
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

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'farmago':
        return Colors.blue;
      case 'linx':
        return Colors.purple;
      case 'aotech':
        return Colors.orange;
      case 'alpha7':
        return Colors.green;
      case 'inovafarma':
        return Colors.teal;
      case 'default':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'farmago':
        return Icons.local_pharmacy;
      case 'linx':
        return Icons.store;
      case 'aotech':
        return Icons.computer;
      case 'alpha7':
        return Icons.apartment;
      case 'inovafarma':
        return Icons.science;
      case 'default':
        return Icons.text_snippet;
      default:
        return Icons.text_snippet;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _handlePromptAction(String action, PromptModel prompt) {
    switch (action) {
      case 'edit':
        _showEditPromptDialog(prompt);
        break;
      case 'delete':
        _showDeleteConfirm(prompt);
        break;
    }
  }

  void _showAddPromptDialog() {
    _controller!.clearForm();
    _showPromptFormDialog(isEdit: false);
  }

  void _showEditPromptDialog(PromptModel prompt) {
    _controller!.selectPrompt(prompt);
    _showPromptFormDialog(isEdit: true);
  }

  void _showPromptFormDialog({required bool isEdit}) {
    showDialog(
      context: context,
      builder: (context) =>
          _PromptFormDialog(controller: _controller!, isEdit: isEdit),
    );
  }

  void _showDeleteConfirm(PromptModel prompt) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Excluir Prompt'),
        content: Text('Deseja excluir o prompt "${prompt.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              await _controller!.deletePrompt(prompt.id);
              Get.snackbar(
                'Sucesso',
                'Prompt excluído',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}

class _PromptFormDialog extends StatelessWidget {
  final PromptsController controller;
  final bool isEdit;

  const _PromptFormDialog({required this.controller, required this.isEdit});

  static const List<Map<String, String>> _dynamicVariables = [
    {'tag': '{appName}', 'description': 'Nome do aplicativo'},
    {'tag': '{client}', 'description': 'Flavor do app'},
    {'tag': '{agentName}', 'description': 'Agente atual'},
    {'tag': '{type}', 'description': 'Tipo do prompt'},
    {'tag': '{userName}', 'description': 'Nome do usuário'},
    {'tag': '{userEmail}', 'description': 'E-mail do usuário'},
    {'tag': '{language}', 'description': 'Idioma do usuário'},
  ];

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copiado: $text'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 800),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  isEdit ? 'Editar Prompt' : 'Novo Prompt',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        initialValue: controller.selectedType.value,
                        decoration: const InputDecoration(
                          labelText: 'Tipo',
                          border: OutlineInputBorder(),
                        ),
                        items: controller.availableTypes.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(_getTypeLabel(type)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedType.value = value;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: controller.welcomeMessageController,
                      decoration: const InputDecoration(
                        labelText: 'Mensagem de Boas-vindas',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Variáveis Dinâmicas',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _dynamicVariables.map((variable) {
                        return Tooltip(
                          message: variable['description']!,
                          child: InkWell(
                            onTap: () =>
                                _copyToClipboard(context, variable['tag']!),
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer.withValues(
                                  alpha: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: colorScheme.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    variable['tag']!,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.primary,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.copy,
                                    size: 14,
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: controller.promptController,
                      decoration: const InputDecoration(
                        labelText: 'Conteúdo do Prompt',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 12,
                    ),
                  ],
                ),
              ),
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
                  child: const Text('Cancelar'),
                ),
                const SizedBox(width: 12),
                Obx(
                  () => FilledButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            bool success;
                            if (isEdit) {
                              success = await controller.updatePromptFromForm();
                            } else {
                              success = await controller.createPromptFromForm();
                            }
                            if (success && context.mounted) {
                              Navigator.pop(context);
                              Get.snackbar(
                                'Sucesso',
                                isEdit ? 'Prompt atualizado' : 'Prompt criado',
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
                        : Text(isEdit ? 'Salvar' : 'Criar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getTypeLabel(String type) {
    switch (type.toLowerCase()) {
      case 'linx':
        return 'Linx';
      case 'farmago':
        return 'FarmaGO';
      case 'aotech':
        return 'AOTech';
      case 'alpha7':
        return 'Alpha7';
      case 'inovafarma':
        return 'Inova Farma';
      case 'default':
        return 'Padrão';
      default:
        return type;
    }
  }
}
