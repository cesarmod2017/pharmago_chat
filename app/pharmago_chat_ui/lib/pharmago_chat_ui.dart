/// PharmaGO Chat UI - A Flutter package for building chat interfaces.
///
/// This library provides UI components for building chat functionality
/// in PharmaGO applications across Android, iOS, Windows, and Web platforms.
///
/// ## Modules
///
/// - **Chat Module**: AI-powered chatbot with streaming support
/// - **RAG Module**: Knowledge base management with semantic search
/// - **Support Module**: Human support transfer with real-time messaging
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
/// ## Quick Start - Chat Module
///
/// ```dart
/// import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';
///
/// // Option 1: Use built-in environment configuration (recommended)
/// final bindingFactory = ChatBindingFactory(
///   channelFactory: ChatEnvironment.channelFactory,
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
/// ## Quick Start - RAG Module
///
/// ```dart
/// import 'package:pharmago_chat_ui/modules/rag/rag_module.dart';
///
/// final ragBindingFactory = RagBindingFactory(
///   channelFactory: RagEnvironment.channelFactory,
/// );
///
/// final ragPages = RagPages(bindingFactory: ragBindingFactory);
///
/// GetMaterialApp(
///   getPages: [...ragPages.getPages()],
/// );
///
/// Get.toNamed(RagRoutes.rag);
/// ```
///
/// ## Quick Start - Support Module
///
/// ```dart
/// import 'package:pharmago_chat_ui/modules/support/support_module.dart';
///
/// final supportBindingFactory = SupportBindingFactory(
///   channelFactory: SupportEnvironment.channelFactory,
/// );
///
/// final supportPages = SupportPages(bindingFactory: supportBindingFactory);
///
/// GetMaterialApp(
///   getPages: [
///     ...supportPages.getPages(
///       operatorId: 'operator-123',
///       operatorName: 'John Doe',
///     ),
///   ],
/// );
///
/// Get.toNamed(SupportRoutes.support);
/// ```
///
/// ## Entry Points
///
/// The example app provides multiple entry points:
/// - `main.dart` - Original chat-only entry point
/// - `main_chat.dart` - Chat module only
/// - `main_rag.dart` - RAG module only
/// - `main_support.dart` - Support module only
/// - `main_all.dart` - All modules combined with module selector
library;

// gRPC exports
export 'src/grpc/grpc_exports.dart';

// Chat module exports
export 'modules/chat/chat_module.dart';

// RAG module exports
export 'modules/rag/rag_module.dart';

// Support module exports
export 'modules/support/support_module.dart';
