import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../controllers/rag_controller.dart';
import '../providers/rag_provider.dart';

class RagBinding implements Bindings {
  final Future<ClientChannel> Function() channelFactory;

  RagBinding({required this.channelFactory});

  @override
  void dependencies() {
    Get.lazyPut<RagProvider>(
      () => RagProvider(channelFactory: channelFactory),
      fenix: true,
    );

    Get.lazyPut<RagController>(
      () => RagController(provider: Get.find<RagProvider>()),
      fenix: true,
    );
  }
}

class RagBindingFactory {
  final Future<ClientChannel> Function() channelFactory;

  const RagBindingFactory({required this.channelFactory});

  RagBinding create() {
    return RagBinding(channelFactory: channelFactory);
  }
}
