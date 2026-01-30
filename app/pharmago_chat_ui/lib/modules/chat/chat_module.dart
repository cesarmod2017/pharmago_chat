// Chat Module - PharmaGO Chat UI
//
// This module provides a complete chat interface with GetX state management.
//
// Usage:
// 1. Create a ChatBindingFactory with your gRPC channel factory
// 2. Register the chat routes in your app
// 3. Navigate to ChatRoutes.chat
//
// Example:
// ```dart
// final chatBindingFactory = ChatBindingFactory(
//   channelFactory: () async => yourGrpcChannel,
// );
//
// final chatPages = ChatPages(bindingFactory: chatBindingFactory);
//
// // Add to GetMaterialApp routes:
// getPages: [
//   ...chatPages.getPages(
//     userName: 'John Doe',
//     userEmail: 'john@example.com',
//   ),
// ]
//
// // Navigate to chat:
// Get.toNamed(ChatRoutes.chat);
// ```

// Bindings
export 'bindings/chat_binding.dart';

// Config
export 'config/chat_environment.dart';

// Controllers
export 'controllers/chat_controller.dart';

// Models
export 'models/chat_contact_model.dart';
export 'models/chat_message_model.dart';

// Pages
export 'pages/chat_page.dart';

// Providers
export 'providers/chat_provider.dart';

// Resources
export 'resources/chat_translations.dart';

// Routes
export 'routes/chat_routes.dart';

// Theme
export 'theme/chat_theme.dart';

// Widgets
export 'widgets/chat_bubble.dart';
export 'widgets/chat_connection_error.dart';
export 'widgets/chat_header.dart';
export 'widgets/chat_input.dart';
export 'widgets/chat_message_list.dart';
export 'widgets/chat_typing_indicator.dart';
