/// Ponto de entrada para teste com conexão gRPC REAL
///
/// Este arquivo força o uso de conexão real com o backend gRPC,
/// ignorando o modo de demonstração.
///
/// Para executar:
/// ```bash
/// # Debug - conecta a localhost:5144
/// flutter run -t lib/main_real.dart
///
/// # Release - conecta ao servidor de produção
/// flutter run --release -t lib/main_real.dart
/// ```
///
/// Certifique-se de que o backend está rodando:
/// ```bash
/// cd pharmago_chat/PharmaGo.Chat.Grpc
/// dotnet run
/// ```

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';

void main() {
  // Configurar para localhost em debug, produção em release
  if (kDebugMode) {
    ChatEnvironment.configure(
      host: 'localhost',
      port: 5144,
      useTls: false,
    );
  } else {
    // Em produção, usar URL configurada
    ChatEnvironment.setReleaseHost('chat.pharmago.com.br');
  }

  debugPrint('=====================================');
  debugPrint('[CHAT] MODO REAL ATIVO');
  debugPrint('[CHAT] ${ChatEnvironment.description}');
  debugPrint('=====================================');

  runApp(const RealChatApp());
}

class RealChatApp extends StatelessWidget {
  const RealChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PharmaGO Chat - Real Mode',
      debugShowCheckedModeBanner: false,
      translations: _ChatTranslations(),
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const RealChatPage(),
    );
  }
}

class _ChatTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => ChatTranslations.translations;
}

class RealChatPage extends StatefulWidget {
  const RealChatPage({super.key});

  @override
  State<RealChatPage> createState() => _RealChatPageState();
}

class _RealChatPageState extends State<RealChatPage> {
  ChatController? _controller;
  ChatProvider? _provider;
  bool _isConnecting = true;
  String? _connectionError;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  Future<void> _connect() async {
    setState(() {
      _isConnecting = true;
      _connectionError = null;
    });

    try {
      _provider = ChatProvider(channelFactory: ChatEnvironment.channelFactory);
      _controller = ChatController(
        provider: _provider!,
        userName: 'Usuário Teste',
        userEmail: 'teste@pharmago.com.br',
        useStreaming: true,
        metadata: {
          'source': 'real_mode_test',
          'platform': defaultTargetPlatform.name,
          'version': '1.0.0',
        },
      );

      Get.put<ChatController>(_controller!);

      setState(() {
        _isConnecting = false;
      });
    } catch (e) {
      setState(() {
        _isConnecting = false;
        _connectionError = 'Erro ao conectar: $e';
      });
    }
  }

  @override
  void dispose() {
    Get.delete<ChatController>();
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isConnecting) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PharmaGO Chat'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Colors.green),
              const SizedBox(height: 16),
              Text('Conectando a ${ChatEnvironment.host}:${ChatEnvironment.port}...'),
              const SizedBox(height: 8),
              Text(
                ChatEnvironment.useTls ? 'TLS ativo' : 'Conexão insegura',
                style: TextStyle(
                  color: ChatEnvironment.useTls ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (_connectionError != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PharmaGO Chat'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Falha na Conexão',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  _connectionError!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Verifique se o backend está rodando:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        'cd PharmaGo.Chat.Grpc\ndotnet run',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _connect,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ChatPageWidget(
          controller: _controller!,
          contact: ChatContactModel(
            name: 'Assistente PharmaGO',
            subtitle: 'Online - ${ChatEnvironment.host}:${ChatEnvironment.port}',
            isOnline: true,
          ),
          onBackPressed: () => Navigator.of(context).pop(),
          headerActions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => _showConnectionInfo(context),
              tooltip: 'Info da Conexão',
            ),
          ],
          inputHintText: 'Digite sua mensagem...',
        ),
      ),
    );
  }

  void _showConnectionInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.cloud_done, color: Colors.green),
            SizedBox(width: 8),
            Text('Conexão Real Ativa'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow('Host', ChatEnvironment.host),
            _infoRow('Porta', ChatEnvironment.port.toString()),
            _infoRow('TLS', ChatEnvironment.useTls ? 'Sim' : 'Não'),
            _infoRow('Modo', kDebugMode ? 'Debug' : 'Release'),
            const Divider(),
            const Text(
              'As mensagens estão sendo processadas pelo servidor gRPC real com integração de IA.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontFamily: 'monospace')),
        ],
      ),
    );
  }
}
