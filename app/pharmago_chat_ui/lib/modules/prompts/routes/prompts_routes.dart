import 'package:get/get.dart';

import '../bindings/prompts_binding.dart';
import '../pages/prompts_page.dart';

abstract class PromptsRoutes {
  static const prompts = '/prompts';
  static const promptsAdd = '/prompts/add';
  static const promptsEdit = '/prompts/edit';
  static const promptsDetail = '/prompts/detail';
}

class PromptsPages {
  final PromptsBindingFactory bindingFactory;

  const PromptsPages({required this.bindingFactory});

  List<GetPage> getPages({
    Transition? transition,
  }) {
    return [
      GetPage(
        name: PromptsRoutes.prompts,
        page: () => const PromptsPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: PromptsRoutes.promptsAdd,
        page: () => const PromptsAddPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: PromptsRoutes.promptsEdit,
        page: () => const PromptsEditPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: PromptsRoutes.promptsDetail,
        page: () => const PromptsDetailPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
    ];
  }
}
