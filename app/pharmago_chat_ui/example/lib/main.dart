import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';
import 'package:pharmago_chat_ui/modules/prompts/prompts_module.dart';
import 'package:pharmago_chat_ui/modules/rag/rag_module.dart';
import 'package:pharmago_chat_ui/modules/support/support_module.dart';

import 'pages/admin_page.dart';

void main() {
  debugPrint('[APP] Starting PharmaGO Chat Suite');
  debugPrint('[APP] Chat Environment: ${ChatEnvironment.description}');
  debugPrint('[APP] RAG Environment: ${RagEnvironment.description}');
  debugPrint('[APP] Support Environment: ${SupportEnvironment.description}');
  debugPrint('[APP] Prompts Environment: ${PromptsEnvironment.description}');

  runApp(const PharmaGoChatApp());
}

class PharmaGoChatApp extends StatelessWidget {
  const PharmaGoChatApp({super.key});

  static final _promptsBindingFactory = PromptsBindingFactory(
    channelFactory: PromptsEnvironment.channelFactory,
  );

  static final _promptsPages = PromptsPages(
    bindingFactory: _promptsBindingFactory,
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PharmaGO Chat Suite',
      debugShowCheckedModeBanner: false,
      translations: _AppTranslations(),
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('en', 'US'),
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      getPages: [
        ..._promptsPages.getPages(),
      ],
      home: const AdminPage(),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2563EB),
        brightness: Brightness.light,
        primary: const Color(0xFF2563EB),
        secondary: const Color(0xFF7C3AED),
        surface: Colors.white,
        surfaceContainerHighest: const Color(0xFFF1F5F9),
      ),
      useMaterial3: true,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF1E293B),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE2E8F0),
        thickness: 1,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF3B82F6),
        brightness: Brightness.dark,
        primary: const Color(0xFF3B82F6),
        secondary: const Color(0xFF8B5CF6),
        surface: const Color(0xFF1E293B),
        surfaceContainerHighest: const Color(0xFF334155),
      ),
      useMaterial3: true,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Color(0xFF1E293B),
        foregroundColor: Color(0xFFF1F5F9),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF334155),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF475569)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF475569)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF475569),
        thickness: 1,
      ),
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

    for (final entry in PromptsTranslations.translations.entries) {
      merged[entry.key] = {...?merged[entry.key], ...entry.value};
    }

    return merged;
  }
}
