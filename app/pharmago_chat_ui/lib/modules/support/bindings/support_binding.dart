import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../controllers/support_controller.dart';
import '../providers/support_provider.dart';

class SupportBinding implements Bindings {
  final Future<ClientChannel> Function() channelFactory;
  final String? operatorId;
  final String? operatorName;

  SupportBinding({
    required this.channelFactory,
    this.operatorId,
    this.operatorName,
  });

  @override
  void dependencies() {
    Get.lazyPut<SupportProvider>(
      () => SupportProvider(channelFactory: channelFactory),
      fenix: true,
    );

    Get.lazyPut<SupportController>(
      () => SupportController(
        provider: Get.find<SupportProvider>(),
        operatorId: operatorId,
        operatorName: operatorName,
      ),
      fenix: true,
    );
  }
}

class SupportBindingFactory {
  final Future<ClientChannel> Function() channelFactory;

  const SupportBindingFactory({required this.channelFactory});

  SupportBinding create({
    String? operatorId,
    String? operatorName,
  }) {
    return SupportBinding(
      channelFactory: channelFactory,
      operatorId: operatorId,
      operatorName: operatorName,
    );
  }
}
