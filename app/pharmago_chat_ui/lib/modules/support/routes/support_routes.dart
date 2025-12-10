import 'package:get/get.dart';

import '../bindings/support_binding.dart';
import '../pages/support_page.dart';

abstract class SupportRoutes {
  static const support = '/support';
  static const supportQueue = '/support/queue';
  static const supportSession = '/support/session';
}

class SupportPages {
  final SupportBindingFactory bindingFactory;

  const SupportPages({required this.bindingFactory});

  List<GetPage> getPages({
    String? operatorId,
    String? operatorName,
    Transition? transition,
  }) {
    return [
      GetPage(
        name: SupportRoutes.support,
        page: () => const SupportDashboardPage(),
        binding: bindingFactory.create(
          operatorId: operatorId,
          operatorName: operatorName,
        ),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: SupportRoutes.supportQueue,
        page: () => const SupportQueuePage(),
        binding: bindingFactory.create(
          operatorId: operatorId,
          operatorName: operatorName,
        ),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: SupportRoutes.supportSession,
        page: () => const SupportSessionPage(),
        binding: bindingFactory.create(
          operatorId: operatorId,
          operatorName: operatorName,
        ),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
    ];
  }
}
