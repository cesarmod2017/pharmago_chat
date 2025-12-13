import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../controllers/prompts_controller.dart';
import '../providers/prompts_provider.dart';

class PromptsBinding implements Bindings {
  final Future<ClientChannel> Function() channelFactory;

  PromptsBinding({required this.channelFactory});

  @override
  void dependencies() {
    Get.lazyPut<PromptsProvider>(
      () => PromptsProvider(channelFactory: channelFactory),
      fenix: true,
    );

    Get.lazyPut<PromptsController>(
      () => PromptsController(provider: Get.find<PromptsProvider>()),
      fenix: true,
    );
  }
}

class PromptsBindingFactory {
  final Future<ClientChannel> Function() channelFactory;

  const PromptsBindingFactory({required this.channelFactory});

  PromptsBinding create() {
    return PromptsBinding(channelFactory: channelFactory);
  }
}
