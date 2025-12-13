import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/prompts_controller.dart';
import '../models/prompt_model.dart';
import '../routes/prompts_routes.dart';

class PromptsPage extends GetView<PromptsController> {
  const PromptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prompts_title'.tr),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            tooltip: 'prompts_filter_by_type'.tr,
            onSelected: (value) {
              if (value == 'all') {
                controller.loadPrompts();
              } else {
                controller.loadPromptsByType(value);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'all',
                child: Text('prompts_all_types'.tr),
              ),
              const PopupMenuDivider(),
              ...controller.availableTypes.map((type) => PopupMenuItem(
                    value: type,
                    child: Text('prompts_type_$type'.tr),
                  )),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshPrompts,
            tooltip: 'prompts_refresh'.tr,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(PromptsRoutes.promptsAdd),
        tooltip: 'prompts_add'.tr,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.prompts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value != null && controller.prompts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(controller.error.value!),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.refreshPrompts,
                  child: Text('prompts_refresh'.tr),
                ),
              ],
            ),
          );
        }

        if (controller.prompts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.edit_note, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'prompts_no_prompts'.tr,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshPrompts,
          child: ListView.builder(
            itemCount: controller.prompts.length,
            itemBuilder: (context, index) {
              final prompt = controller.prompts[index];
              return PromptListTile(
                prompt: prompt,
                onTap: () {
                  controller.selectPrompt(prompt);
                  Get.toNamed(PromptsRoutes.promptsDetail);
                },
                onEdit: () {
                  controller.selectPrompt(prompt);
                  Get.toNamed(PromptsRoutes.promptsEdit);
                },
                onDelete: () => _showDeleteConfirm(context, prompt),
              );
            },
          ),
        );
      }),
    );
  }

  void _showDeleteConfirm(BuildContext context, PromptModel prompt) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('prompts_delete'.tr),
        content: Text('prompts_delete_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('prompts_cancel'.tr),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await controller.deletePrompt(prompt.id);
              if (success) {
                Get.snackbar(
                  'prompts_title'.tr,
                  'prompts_delete_success'.tr,
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('prompts_delete'.tr),
          ),
        ],
      ),
    );
  }
}

class PromptListTile extends StatelessWidget {
  final PromptModel prompt;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const PromptListTile({
    super.key,
    required this.prompt,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: _getTypeIcon(),
        title: Text(
          prompt.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prompt.typeLabel,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              prompt.promptPreview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                onEdit?.call();
                break;
              case 'delete':
                onDelete?.call();
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  const Icon(Icons.edit, size: 20),
                  const SizedBox(width: 8),
                  Text('prompts_edit'.tr),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  const Icon(Icons.delete, size: 20, color: Colors.red),
                  const SizedBox(width: 8),
                  Text('prompts_delete'.tr,
                      style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _getTypeIcon() {
    IconData icon;
    Color color;

    switch (prompt.type.toLowerCase()) {
      case 'farmago':
        icon = Icons.local_pharmacy;
        color = Colors.green;
        break;
      case 'linx':
        icon = Icons.link;
        color = Colors.blue;
        break;
      case 'aotech':
        icon = Icons.settings;
        color = Colors.orange;
        break;
      case 'alpha7':
        icon = Icons.star;
        color = Colors.purple;
        break;
      case 'pharmatec':
        icon = Icons.biotech;
        color = Colors.teal;
        break;
      default:
        icon = Icons.edit_note;
        color = Colors.grey;
    }

    return CircleAvatar(
      backgroundColor: color.withValues(alpha: 0.1),
      child: Icon(icon, color: color),
    );
  }
}

class PromptsAddPage extends GetView<PromptsController> {
  const PromptsAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.clearForm();
    return Scaffold(
      appBar: AppBar(
        title: Text('prompts_add'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'prompts_name'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedType.value,
                  decoration: InputDecoration(
                    labelText: 'prompts_type'.tr,
                    border: const OutlineInputBorder(),
                  ),
                  items: controller.availableTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text('prompts_type_$type'.tr),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedType.value = value;
                    }
                  },
                )),
            const SizedBox(height: 16),
            TextField(
              controller: controller.promptController,
              decoration: InputDecoration(
                labelText: 'prompts_prompt'.tr,
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 15,
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
                              await controller.createPromptFromForm();
                          if (success) {
                            Get.back();
                            Get.snackbar(
                              'prompts_title'.tr,
                              'prompts_add_success'.tr,
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
                      : Text('prompts_save'.tr),
                )),
          ],
        ),
      ),
    );
  }
}

class PromptsEditPage extends GetView<PromptsController> {
  const PromptsEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prompts_edit'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'prompts_name'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedType.value,
                  decoration: InputDecoration(
                    labelText: 'prompts_type'.tr,
                    border: const OutlineInputBorder(),
                  ),
                  items: controller.availableTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text('prompts_type_$type'.tr),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedType.value = value;
                    }
                  },
                )),
            const SizedBox(height: 16),
            TextField(
              controller: controller.promptController,
              decoration: InputDecoration(
                labelText: 'prompts_prompt'.tr,
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 15,
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
                              await controller.updatePromptFromForm();
                          if (success) {
                            Get.back();
                            Get.snackbar(
                              'prompts_title'.tr,
                              'prompts_update_success'.tr,
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
                      : Text('prompts_save'.tr),
                )),
          ],
        ),
      ),
    );
  }
}

class PromptsDetailPage extends GetView<PromptsController> {
  const PromptsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prompts_view_details'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.offNamed(PromptsRoutes.promptsEdit);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDeleteConfirm(context),
            color: Colors.red,
          ),
        ],
      ),
      body: Obx(() {
        final prompt = controller.selectedPrompt.value;
        if (prompt == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard(
                title: 'prompts_name'.tr,
                content: prompt.name,
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'prompts_type'.tr,
                content: prompt.typeLabel,
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'prompts_created'.tr,
                content: _formatDate(prompt.createdAt),
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'prompts_updated'.tr,
                content: _formatDate(prompt.updatedAt),
              ),
              const SizedBox(height: 16),
              Text(
                'prompts_prompt'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  prompt.prompt,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                  ),
                ),
              ),
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
    final prompt = controller.selectedPrompt.value;
    if (prompt == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('prompts_delete'.tr),
        content: Text('prompts_delete_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('prompts_cancel'.tr),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await controller.deletePrompt(prompt.id);
              if (success) {
                Get.back();
                Get.snackbar(
                  'prompts_title'.tr,
                  'prompts_delete_success'.tr,
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('prompts_delete'.tr),
          ),
        ],
      ),
    );
  }
}
