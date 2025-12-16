import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/prompt_model.dart';
import '../providers/prompts_provider.dart';

class PromptsController extends GetxController {
  final PromptsProvider provider;

  PromptsController({required this.provider});

  final prompts = <PromptModel>[].obs;
  final isLoading = false.obs;
  final error = Rxn<String>();
  final selectedPrompt = Rxn<PromptModel>();
  final totalCount = 0.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController promptController = TextEditingController();
  final TextEditingController welcomeMessageController =
      TextEditingController();
  final selectedType = 'farmago'.obs;

  // Available prompt types
  final List<String> availableTypes = [
    'farmago',
    'linx',
    'aotech',
    'alpha7',
    'inovafarma',
    'default',
  ];

  @override
  void onInit() {
    super.onInit();
    loadPrompts();
  }

  @override
  void onClose() {
    nameController.dispose();
    promptController.dispose();
    welcomeMessageController.dispose();
    super.onClose();
  }

  Future<void> loadPrompts({int limit = 50, int offset = 0}) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.listPrompts(limit: limit, offset: offset);

      if (offset == 0) {
        prompts.clear();
      }

      for (final proto in response.prompts) {
        prompts.add(PromptModel.fromProto(proto));
      }
      totalCount.value = response.totalCount;
    } catch (e) {
      error.value = 'prompts_error_load'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadPromptsByType(String type) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.getPromptsByType(type: type);

      prompts.clear();
      for (final proto in response.prompts) {
        prompts.add(PromptModel.fromProto(proto));
      }
      totalCount.value = response.totalCount;
    } catch (e) {
      error.value = 'prompts_error_load'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshPrompts() async {
    await loadPrompts();
  }

  Future<PromptModel?> getPrompt(String id) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.getPrompt(id: id);
      final prompt = PromptModel.fromProto(response);
      selectedPrompt.value = prompt;
      return prompt;
    } catch (e) {
      error.value = 'prompts_error_get'.tr;
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> createPrompt({
    required String name,
    required String type,
    required String prompt,
    required String welcomeMessage,
  }) async {
    isLoading.value = true;
    error.value = null;

    try {
      await provider.createPrompt(
        name: name,
        type: type,
        prompt: prompt,
        welcomeMessage: welcomeMessage,
      );
      await refreshPrompts();
      return true;
    } catch (e) {
      error.value = 'prompts_error_create'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> createPromptFromForm() async {
    final name = nameController.text.trim();
    final prompt = promptController.text.trim();
    final welcomeMessage = welcomeMessageController.text.trim();

    if (name.isEmpty || prompt.isEmpty) {
      error.value = 'prompts_error_required_fields'.tr;
      return false;
    }

    final success = await createPrompt(
      name: name,
      type: selectedType.value,
      prompt: prompt,
      welcomeMessage: welcomeMessage,
    );

    if (success) {
      clearForm();
    }

    return success;
  }

  Future<bool> updatePrompt({
    required String id,
    required String name,
    required String type,
    required String prompt,
    required String welcomeMessage,
  }) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.updatePrompt(
        id: id,
        name: name,
        type: type,
        prompt: prompt,
        welcomeMessage: welcomeMessage,
      );
      if (response.success) {
        await refreshPrompts();
        return true;
      }
      return false;
    } catch (e) {
      error.value = 'prompts_error_update'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> updatePromptFromForm() async {
    final current = selectedPrompt.value;
    if (current == null) {
      error.value = 'prompts_error_no_selection'.tr;
      return false;
    }

    final name = nameController.text.trim();
    final prompt = promptController.text.trim();
    final welcomeMessage = welcomeMessageController.text.trim();

    if (name.isEmpty || prompt.isEmpty) {
      error.value = 'prompts_error_required_fields'.tr;
      return false;
    }

    final success = await updatePrompt(
      id: current.id,
      name: name,
      type: selectedType.value,
      prompt: prompt,
      welcomeMessage: welcomeMessage,
    );

    if (success) {
      clearForm();
      selectedPrompt.value = null;
    }

    return success;
  }

  Future<bool> deletePrompt(String id) async {
    isLoading.value = true;
    error.value = null;

    try {
      final response = await provider.deletePrompt(id: id);
      if (response.success) {
        prompts.removeWhere((p) => p.id == id);
        if (selectedPrompt.value?.id == id) {
          selectedPrompt.value = null;
        }
        return true;
      }
      return false;
    } catch (e) {
      error.value = 'prompts_error_delete'.tr;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void selectPrompt(PromptModel prompt) {
    selectedPrompt.value = prompt;
    nameController.text = prompt.name;
    promptController.text = prompt.prompt;
    welcomeMessageController.text = prompt.welcomeMessage;
    selectedType.value = prompt.type;
  }

  void clearSelectedPrompt() {
    selectedPrompt.value = null;
    clearForm();
  }

  void clearForm() {
    nameController.clear();
    promptController.clear();
    welcomeMessageController.clear();
    selectedType.value = 'farmago';
  }
}
