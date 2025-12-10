import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';
import 'package:pharmago_chat_ui/modules/rag/rag_module.dart';
import 'package:pharmago_chat_ui/modules/support/support_module.dart';

import 'pages/home_page.dart';

void main() {
  debugPrint('[APP] Starting PharmaGO Chat Suite');
  debugPrint('[APP] Chat Environment: ${ChatEnvironment.description}');
  debugPrint('[APP] RAG Environment: ${RagEnvironment.description}');
  debugPrint('[APP] Support Environment: ${SupportEnvironment.description}');

  runApp(const PharmaGoChatApp());
}

class PharmaGoChatApp extends StatelessWidget {
  const PharmaGoChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PharmaGO Chat Suite',
      debugShowCheckedModeBanner: false,
      translations: _AppTranslations(),
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class _AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    final merged = <String, Map<String, String>>{};

    for (final entry in ChatTranslations.translations.entries) {
      merged[entry.key] = {...?merged[entry.key], ...entry.value};
    }

    for (final entry in RagTranslations.translations.entries) {
      merged[entry.key] = {...?merged[entry.key], ...entry.value};
    }

    for (final entry in SupportTranslations.translations.entries) {
      merged[entry.key] = {...?merged[entry.key], ...entry.value};
    }

    return merged;
  }
}
