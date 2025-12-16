import 'package:get/get.dart';

import '../bindings/rag_binding.dart';
import '../pages/rag_page.dart';

abstract class RagRoutes {
  static const rag = '/rag';
  static const ragSearch = '/rag/search';
  static const ragDocument = '/rag/document';
  static const ragAdd = '/rag/add';
  // EmbeddingDocument routes
  static const ragEmbeddingAdd = '/rag/embedding/add';
  static const ragEmbeddingSearch = '/rag/embedding/search';
  // Batch upload route
  static const ragBatchUpload = '/rag/batch-upload';
}

class RagPages {
  final RagBindingFactory bindingFactory;

  const RagPages({required this.bindingFactory});

  List<GetPage> getPages({
    Transition? transition,
  }) {
    return [
      GetPage(
        name: RagRoutes.rag,
        page: () => const RagPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: RagRoutes.ragSearch,
        page: () => const RagSearchPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: RagRoutes.ragDocument,
        page: () => const RagDocumentDetailPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: RagRoutes.ragAdd,
        page: () => const RagAddDocumentPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      // EmbeddingDocument pages
      GetPage(
        name: RagRoutes.ragEmbeddingAdd,
        page: () => const RagAddEmbeddingDocumentPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      GetPage(
        name: RagRoutes.ragEmbeddingSearch,
        page: () => const RagEmbeddingSearchPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
      // Batch upload page
      GetPage(
        name: RagRoutes.ragBatchUpload,
        page: () => const RagBatchUploadPage(),
        binding: bindingFactory.create(),
        transition: transition ?? Transition.rightToLeft,
        preventDuplicates: true,
      ),
    ];
  }
}
