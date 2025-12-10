// Support Module - PharmaGO Chat UI
//
// This module provides human support transfer functionality with real-time messaging.
//
// Usage:
// 1. Create a SupportBindingFactory with your gRPC channel factory
// 2. Register the Support routes in your app
// 3. Navigate to SupportRoutes.support
//
// Example:
// ```dart
// final supportBindingFactory = SupportBindingFactory(
//   channelFactory: () async => yourGrpcChannel,
// );
//
// final supportPages = SupportPages(bindingFactory: supportBindingFactory);
//
// // Add to GetMaterialApp routes:
// getPages: [
//   ...supportPages.getPages(
//     operatorId: 'operator-123',
//     operatorName: 'John Doe',
//   ),
// ]
//
// // Navigate to Support:
// Get.toNamed(SupportRoutes.support);
// ```

// Bindings
export 'bindings/support_binding.dart';

// Config
export 'config/support_environment.dart';

// Controllers
export 'controllers/support_controller.dart';

// Models
export 'models/support_models.dart';

// Pages
export 'pages/support_page.dart';

// Providers
export 'providers/support_provider.dart';

// Resources
export 'resources/support_translations.dart';

// Routes
export 'routes/support_routes.dart';
