// RAG Module - PharmaGO Chat UI
//
// This module provides knowledge base management with semantic search capabilities.
//
// Usage:
// 1. Create a RagBindingFactory with your gRPC channel factory
// 2. Register the RAG routes in your app
// 3. Navigate to RagRoutes.rag
//
// Example:
// ```dart
// final ragBindingFactory = RagBindingFactory(
//   channelFactory: () async => yourGrpcChannel,
// );
//
// final ragPages = RagPages(bindingFactory: ragBindingFactory);
//
// // Add to GetMaterialApp routes:
// getPages: [
//   ...ragPages.getPages(),
// ]
//
// // Navigate to RAG:
// Get.toNamed(RagRoutes.rag);
// ```

// Bindings
export 'bindings/rag_binding.dart';

// Config
export 'config/rag_environment.dart';

// Controllers
export 'controllers/rag_controller.dart';

// Models
export 'models/rag_document_model.dart';

// Pages
export 'pages/rag_page.dart';

// Providers
export 'providers/rag_provider.dart';

// Resources
export 'resources/rag_translations.dart';

// Routes
export 'routes/rag_routes.dart';
