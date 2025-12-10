/// PharmaGO Chat UI - A Flutter package for building chat interfaces.
///
/// This library provides UI components for building chat functionality
/// in PharmaGO applications across Android, iOS, Windows, and Web platforms.
///
/// ## Features
///
/// - WhatsApp-style chat interface with customizable colors
/// - GetX state management with reactive UI updates
/// - gRPC integration for real-time messaging
/// - Streaming message support with typing indicators
/// - Session management (create, send, history, end)
/// - Multi-language support (en_US, pt_BR, es_ES)
/// - Environment-aware configuration (debug/release)
///
/// ## Quick Start
///
/// ```dart
/// import 'package:pharmago_chat_ui/pharmago_chat_ui.dart';
///
/// // Option 1: Use built-in environment configuration (recommended)
/// // - Debug mode: connects to localhost:5144
/// // - Release mode: connects to production URL:443
/// final bindingFactory = ChatBindingFactory(
///   channelFactory: ChatEnvironment.channelFactory,
/// );
///
/// // Option 2: Custom channel factory
/// final bindingFactory = ChatBindingFactory(
///   channelFactory: () async => yourGrpcChannel,
/// );
///
/// // 2. Create chat pages
/// final chatPages = ChatPages(bindingFactory: bindingFactory);
///
/// // 3. Add routes to your app
/// GetMaterialApp(
///   getPages: [
///     ...chatPages.getPages(
///       userName: 'User Name',
///       userEmail: 'user@example.com',
///     ),
///   ],
/// );
///
/// // 4. Navigate to chat
/// Get.toNamed(ChatRoutes.chat);
/// ```
///
/// ## Environment Configuration
///
/// Use [ChatEnvironment] for environment-aware connections:
///
/// ```dart
/// // Configure production URL before release
/// ChatEnvironment.setReleaseHost('chat.yourcompany.com');
///
/// // Or configure custom settings for testing
/// ChatEnvironment.configure(
///   host: 'staging.yourcompany.com',
///   port: 443,
///   useTls: true,
/// );
///
/// // Check current environment
/// print(ChatEnvironment.description);
/// // Output: [DEBUG] localhost:5144 (insecure)
/// // Or: [RELEASE] chat.yourcompany.com:443 (TLS)
/// ```
library;

// gRPC exports
export 'src/grpc/grpc_exports.dart';

// Chat module exports
// export 'src/modules/chat/chat_module.dart';
