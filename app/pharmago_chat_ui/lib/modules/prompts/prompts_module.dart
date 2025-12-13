// Prompts Module - PharmaGO Chat UI
//
// This module provides CRUD operations for ChatPrompts management.
//
// Usage:
// 1. Create a PromptsBindingFactory with your gRPC channel factory
// 2. Register the Prompts routes in your app
// 3. Navigate to PromptsRoutes.prompts
//
// Example:
// ```dart
// final promptsBindingFactory = PromptsBindingFactory(
//   channelFactory: () async => yourGrpcChannel,
// );
//
// final promptsPages = PromptsPages(bindingFactory: promptsBindingFactory);
//
// // Add to GetMaterialApp routes:
// getPages: [
//   ...promptsPages.getPages(),
// ]
//
// // Navigate to Prompts:
// Get.toNamed(PromptsRoutes.prompts);
// ```

// Bindings
export 'bindings/prompts_binding.dart';

// Config
export 'config/prompts_environment.dart';

// Controllers
export 'controllers/prompts_controller.dart';

// Models
export 'models/prompt_model.dart';

// Pages
export 'pages/prompts_page.dart';

// Providers
export 'providers/prompts_provider.dart';

// Resources
export 'resources/prompts_translations.dart';

// Routes
export 'routes/prompts_routes.dart';
