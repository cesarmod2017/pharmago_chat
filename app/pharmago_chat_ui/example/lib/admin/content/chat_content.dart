import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';

/// Chat content widget for admin layout
class ChatContent extends StatefulWidget {
  const ChatContent({super.key});

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  ChatController? _controller;
  ChatProvider? _provider;
  bool _isInitialized = false;
  String? _initError;

  static const String _tag = 'admin_chat';

  // Theme customization state
  ChatThemeData? _customTheme;
  Color _userBubbleColor = const Color(0xFF075E54);
  Color _userBubbleTextColor = Colors.white;
  Color _assistantBubbleColor = Colors.white;
  Color _assistantBubbleTextColor = Colors.black87;
  Color _backgroundColor = const Color(0xFFECE5DD);
  Color _sendButtonColor = const Color(0xFF075E54);
  Color _headerBackgroundColor = const Color(0xFF075E54);

  // Input customization state
  Color _inputBackgroundColor = Colors.white;
  Color _inputTextColor = Colors.black87;
  Color _inputHintColor = Colors.black54;
  Color _inputBorderColor = const Color(0xFFE0E0E0);
  Color _inputCursorColor = const Color(0xFF075E54);
  Color _sendButtonIconColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    try {
      _provider = ChatProvider(channelFactory: ChatEnvironment.channelFactory);
      _controller = ChatController(
        provider: _provider!,
        userName: 'Administrador',
        userEmail: 'admin@pharmago.com.br',
        useStreaming: true,
        client: 'farmago',
        agentName: 'Assistente PharmaGO',
        erpName: null,
        language: 'pt-BR',
        type: 'farmago',
        metadata: {
          'source': 'admin_panel',
          'platform': defaultTargetPlatform.name,
        },
      );

      Get.put<ChatController>(_controller!, tag: _tag);

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _initError = e.toString();
      });
    }
  }

  @override
  void dispose() {
    Get.delete<ChatController>(tag: _tag);
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return _buildErrorState();
    }

    if (!_isInitialized) {
      return _buildLoadingState();
    }

    return _buildMainContent();
  }

  Widget _buildErrorState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                color: colorScheme.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Erro ao inicializar o chat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _initError!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  _initError = null;
                });
                _initializeChat();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Conectando ao servidor...',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  void _updateCustomTheme() {
    setState(() {
      _customTheme = ChatThemeData(
        userBubbleColor: _userBubbleColor,
        userBubbleTextColor: _userBubbleTextColor,
        assistantBubbleColor: _assistantBubbleColor,
        assistantBubbleTextColor: _assistantBubbleTextColor,
        backgroundColor: _backgroundColor,
        inputBackgroundColor: _inputBackgroundColor,
        inputTextColor: _inputTextColor,
        inputHintColor: _inputHintColor,
        inputBorderColor: _inputBorderColor,
        inputCursorColor: _inputCursorColor,
        inputSelectionColor: _inputCursorColor.withValues(alpha: 0.3),
        sendButtonColor: _sendButtonColor,
        sendButtonIconColor: _sendButtonIconColor,
        headerBackgroundColor: _headerBackgroundColor,
        headerTextColor: Colors.white,
        headerAvatarBackgroundColor: Colors.white.withValues(alpha: 0.2),
        headerAvatarTextColor: Colors.white,
        timestampColor: Colors.grey,
        onlineIndicatorColor: const Color(0xFF4CAF50),
        offlineIndicatorColor: const Color(0xFFF44336),
      );
    });
  }

  void _resetTheme() {
    setState(() {
      _customTheme = null;
      _userBubbleColor = const Color(0xFF075E54);
      _userBubbleTextColor = Colors.white;
      _assistantBubbleColor = Colors.white;
      _assistantBubbleTextColor = Colors.black87;
      _backgroundColor = const Color(0xFFECE5DD);
      _sendButtonColor = const Color(0xFF075E54);
      _headerBackgroundColor = const Color(0xFF075E54);
      // Reset input colors
      _inputBackgroundColor = Colors.white;
      _inputTextColor = Colors.black87;
      _inputHintColor = Colors.black54;
      _inputBorderColor = const Color(0xFFE0E0E0);
      _inputCursorColor = const Color(0xFF075E54);
      _sendButtonIconColor = Colors.white;
    });
  }

  Widget _buildMainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 900;

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 5, child: _buildChatPanel()),
              const SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    _buildCustomizationPanel(),
                    const SizedBox(height: 16),
                    Expanded(child: _buildTutorialPanel()),
                  ],
                ),
              ),
            ],
          );
        } else {
          return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  tabs: const [
                    Tab(text: 'Chat', icon: Icon(Icons.chat)),
                    Tab(text: 'Customizar', icon: Icon(Icons.palette)),
                    Tab(text: 'Tutorial', icon: Icon(Icons.code)),
                  ],
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildChatPanel(),
                      SingleChildScrollView(child: _buildCustomizationPanel()),
                      _buildTutorialPanel(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildChatPanel() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: ChatPageWidget(
        controller: _controller!,
        contact: ChatContactModel(
          name: 'Atendente Linx',
          subtitle: 'Online',
          isOnline: true,
        ),
        showAppBar: true,
        headerActions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller!.clearMessages(),
            tooltip: 'Reiniciar chat',
          ),
        ],
        inputHintText: 'Digite sua mensagem...',
        //inputBackgroundColor: Get.theme.scaffoldBackgroundColor,
        sendOnEnter: true,
        theme: _customTheme,
      ),
    );
  }

  Widget _buildCustomizationPanel() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? colorScheme.surface
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: colorScheme.secondaryContainer),
            child: Row(
              children: [
                Icon(Icons.palette, color: colorScheme.onSecondaryContainer),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Customizar Chat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _resetTheme,
                  icon: const Icon(Icons.restore, size: 18),
                  label: const Text('Resetar'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildColorPicker(
                  label: 'Bubble Usuario',
                  color: _userBubbleColor,
                  onColorChanged: (color) {
                    _userBubbleColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Texto Usuario',
                  color: _userBubbleTextColor,
                  onColorChanged: (color) {
                    _userBubbleTextColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Bubble Assistente',
                  color: _assistantBubbleColor,
                  onColorChanged: (color) {
                    _assistantBubbleColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Texto Assistente',
                  color: _assistantBubbleTextColor,
                  onColorChanged: (color) {
                    _assistantBubbleTextColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Fundo',
                  color: _backgroundColor,
                  onColorChanged: (color) {
                    _backgroundColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Botao Enviar',
                  color: _sendButtonColor,
                  onColorChanged: (color) {
                    _sendButtonColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Header',
                  color: _headerBackgroundColor,
                  onColorChanged: (color) {
                    _headerBackgroundColor = color;
                    _updateCustomTheme();
                  },
                ),
              ],
            ),
          ),
          // Input Section Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.text_fields,
                  size: 18,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'Campo de Entrada',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildColorPicker(
                  label: 'Fundo Input',
                  color: _inputBackgroundColor,
                  onColorChanged: (color) {
                    _inputBackgroundColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Texto Input',
                  color: _inputTextColor,
                  onColorChanged: (color) {
                    _inputTextColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Placeholder',
                  color: _inputHintColor,
                  onColorChanged: (color) {
                    _inputHintColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Borda Input',
                  color: _inputBorderColor,
                  onColorChanged: (color) {
                    _inputBorderColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Cursor',
                  color: _inputCursorColor,
                  onColorChanged: (color) {
                    _inputCursorColor = color;
                    _updateCustomTheme();
                  },
                ),
                _buildColorPicker(
                  label: 'Icone Enviar',
                  color: _sendButtonIconColor,
                  onColorChanged: (color) {
                    _sendButtonIconColor = color;
                    _updateCustomTheme();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _applyPreset('whatsapp'),
                    icon: const Icon(Icons.messenger, size: 18),
                    label: const Text('WhatsApp'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _applyPreset('telegram'),
                    icon: const Icon(Icons.telegram, size: 18),
                    label: const Text('Telegram'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _applyPreset('dark'),
                    icon: const Icon(Icons.dark_mode, size: 18),
                    label: const Text('Dark'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker({
    required String label,
    required Color color,
    required ValueChanged<Color> onColorChanged,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => _showColorPickerDialog(label, color, onColorChanged),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: colorScheme.outline),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontSize: 13, color: colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPickerDialog(
    String label,
    Color currentColor,
    ValueChanged<Color> onColorChanged,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    // Predefined colors for quick selection
    final colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
      Colors.black,
      Colors.white,
      const Color(0xFF075E54), // WhatsApp green
      const Color(0xFF128C7E), // WhatsApp teal
      const Color(0xFF25D366), // WhatsApp light green
      const Color(0xFF0088CC), // Telegram blue
      const Color(0xFF1F2C34), // Dark mode
      const Color(0xFF0B141A), // Dark mode background
      const Color(0xFFECE5DD), // WhatsApp background
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Selecionar cor: $label'),
        content: SizedBox(
          width: 300,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: colors.map((color) {
              final isSelected = color.value == currentColor.value;
              return InkWell(
                onTap: () {
                  onColorChanged(color);
                  Navigator.of(context).pop();
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.outline,
                      width: isSelected ? 3 : 1,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: color.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white,
                          size: 20,
                        )
                      : null,
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void _applyPreset(String preset) {
    setState(() {
      switch (preset) {
        case 'whatsapp':
          _userBubbleColor = const Color(0xFF075E54);
          _userBubbleTextColor = Colors.white;
          _assistantBubbleColor = Colors.white;
          _assistantBubbleTextColor = Colors.black87;
          _backgroundColor = const Color(0xFFECE5DD);
          _sendButtonColor = const Color(0xFF075E54);
          _headerBackgroundColor = const Color(0xFF075E54);
          // Input colors - WhatsApp style
          _inputBackgroundColor = Colors.white;
          _inputTextColor = Colors.black87;
          _inputHintColor = Colors.black54;
          _inputBorderColor = const Color(0xFFE0E0E0);
          _inputCursorColor = const Color(0xFF075E54);
          _sendButtonIconColor = Colors.white;
          break;
        case 'telegram':
          _userBubbleColor = const Color(0xFF0088CC);
          _userBubbleTextColor = Colors.white;
          _assistantBubbleColor = Colors.white;
          _assistantBubbleTextColor = Colors.black87;
          _backgroundColor = const Color(0xFFF0F4F8);
          _sendButtonColor = const Color(0xFF0088CC);
          _headerBackgroundColor = const Color(0xFF0088CC);
          // Input colors - Telegram style
          _inputBackgroundColor = Colors.white;
          _inputTextColor = Colors.black87;
          _inputHintColor = Colors.black45;
          _inputBorderColor = const Color(0xFFE0E0E0);
          _inputCursorColor = const Color(0xFF0088CC);
          _sendButtonIconColor = Colors.white;
          break;
        case 'dark':
          _userBubbleColor = const Color(0xFF005C4B);
          _userBubbleTextColor = Colors.white;
          _assistantBubbleColor = const Color(0xFF1F2C34);
          _assistantBubbleTextColor = Colors.white70;
          _backgroundColor = const Color(0xFF0B141A);
          _sendButtonColor = const Color(0xFF00A884);
          _headerBackgroundColor = const Color(0xFF1F2C34);
          // Input colors - Dark mode style
          _inputBackgroundColor = const Color(0xFF1F2C34);
          _inputTextColor = const Color(0xDEFFFFFF);
          _inputHintColor = const Color(0x80FFFFFF);
          _inputBorderColor = const Color(0xFF2A3942);
          _inputCursorColor = const Color(0xFF00A884);
          _sendButtonIconColor = Colors.white;
          break;
      }
      _updateCustomTheme();
    });
  }

  Widget _buildTutorialPanel() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? colorScheme.surface
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: colorScheme.primaryContainer),
            child: Row(
              children: [
                Icon(
                  Icons.integration_instructions,
                  color: colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 12),
                Text(
                  'Tutorial de Integracao',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('1. Configuracao do Ambiente'),
                  _buildDescription(
                    'Configure o ambiente de conexao gRPC antes de usar o chat.',
                  ),
                  _buildCodeBlock(
                    'chat_environment_config',
                    '''// Configurar ambiente customizado (opcional)
ChatEnvironment.configure(
  host: 'chat.seudominio.com.br',
  port: 443,
  useTls: true,
);

// Ou usar configuracao padrao
// Debug: localhost:5144 (sem TLS)
// Release: chat.pharmago.com.br:443 (com TLS)''',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('2. Criando o Provider'),
                  _buildDescription(
                    'O ChatProvider gerencia a conexao gRPC com o servidor.',
                  ),
                  _buildCodeBlock(
                    'chat_provider_setup',
                    '''// Criar o provider com factory de canal
final provider = ChatProvider(
  channelFactory: ChatEnvironment.channelFactory,
);

// Ou com canal customizado
final provider = ChatProvider(
  channelFactory: () async {
    return ClientChannel(
      'seu-servidor.com',
      port: 443,
      options: const ChannelOptions(
        credentials: ChannelCredentials.secure(),
      ),
    );
  },
);''',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('3. Criando o Controller'),
                  _buildDescription(
                    'O ChatController gerencia o estado do chat e as mensagens.',
                  ),
                  _buildCodeBlock(
                    'chat_controller_setup',
                    '''final controller = ChatController(
  provider: provider,
  userName: 'Nome do Usuario',
  userEmail: 'usuario@email.com',
  client: 'nome_do_cliente',       // Identificador do cliente
  agentName: 'Assistente Virtual', // Nome do bot
  type: 'tipo_chat',               // Tipo de atendimento
  language: 'pt-BR',               // Idioma
  useStreaming: true,              // Respostas em streaming
  metadata: {                      // Metadados adicionais
    'source': 'mobile_app',
    'version': '1.0.0',
  },
);''',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('4. Registrando com GetX'),
                  _buildDescription(
                    'Registre o controller no GetX para uso global ou local.',
                  ),
                  _buildCodeBlock('getx_registration', '''// Registro global
Get.put<ChatController>(controller);

// Registro com tag (multiplas instancias)
Get.put<ChatController>(controller, tag: 'chat_suporte');

// Recuperar instancia
final chat = Get.find<ChatController>();
final chatSuporte = Get.find<ChatController>(tag: 'chat_suporte');

// Remover ao sair
Get.delete<ChatController>();
Get.delete<ChatController>(tag: 'chat_suporte');'''),
                  const SizedBox(height: 24),
                  _buildSectionTitle('5. Usando o Binding'),
                  _buildDescription(
                    'Use ChatBinding para injecao automatica de dependencias.',
                  ),
                  _buildCodeBlock(
                    'chat_binding_usage',
                    '''// Criar factory de binding
final bindingFactory = ChatBindingFactory(
  channelFactory: ChatEnvironment.channelFactory,
);

// Criar binding para rota
final binding = bindingFactory.create(
  userName: 'Usuario',
  userEmail: 'usuario@email.com',
  client: 'farmago',
  agentName: 'Assistente',
  type: 'suporte',
);''',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('6. Configurando Rotas'),
                  _buildDescription(
                    'Adicione as rotas do chat no GetMaterialApp.',
                  ),
                  _buildCodeBlock(
                    'chat_routes_setup',
                    '''// Criar ChatPages com binding factory
final chatPages = ChatPages(
  bindingFactory: ChatBindingFactory(
    channelFactory: ChatEnvironment.channelFactory,
  ),
);

// Adicionar rotas no GetMaterialApp
GetMaterialApp(
  getPages: [
    ...chatPages.getPages(
      userName: 'Usuario',
      userEmail: 'usuario@email.com',
      client: 'farmago',
      agentName: 'Assistente',
      type: 'suporte',
    ),
    // Outras rotas...
  ],
);

// Navegar para o chat
Get.toNamed(ChatRoutes.chat);''',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('7. Usando ChatPageWidget'),
                  _buildDescription(
                    'Incorpore o chat diretamente em qualquer widget.',
                  ),
                  _buildCodeBlock('chat_page_widget', '''ChatPageWidget(
  controller: controller,
  contact: ChatContactModel(
    name: 'Assistente PharmaGO',
    subtitle: 'Online',
    isOnline: true,
  ),
  showAppBar: true,              // Mostrar header
  inputHintText: 'Digite aqui...',
  sendOnEnter: true,             // Enter envia (desktop/web)
  headerActions: [               // Acoes no header
    IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () => controller.clearMessages(),
    ),
  ],
  theme: ChatThemeData.fromTheme(Theme.of(context)),
)'''),
                  const SizedBox(height: 24),
                  _buildSectionTitle('8. Personalizando o Tema'),
                  _buildDescription('Customize as cores e estilos do chat.'),
                  _buildCodeBlock(
                    'chat_theme_customization',
                    '''// Usar tema do app
final theme = ChatThemeData.fromTheme(Theme.of(context));

// Tema claro customizado
final lightTheme = ChatThemeData.light(
  userBubbleColor: Colors.blue,
  assistantBubbleColor: Colors.grey[100],
  sendButtonColor: Colors.blue,
);

// Tema escuro customizado
final darkTheme = ChatThemeData.dark(
  userBubbleColor: Colors.blueGrey,
  backgroundColor: Colors.black,
);

// Aplicar no widget
ChatPageWidget(
  controller: controller,
  theme: theme,
)''',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('9. Exemplo Completo'),
                  _buildDescription(
                    'Exemplo completo de integracao em um StatefulWidget.',
                  ),
                  _buildCodeBlock(
                    'complete_example',
                    '''class MyChatScreen extends StatefulWidget {
  const MyChatScreen({super.key});

  @override
  State<MyChatScreen> createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  late ChatController _controller;
  late ChatProvider _provider;

  @override
  void initState() {
    super.initState();
    _initChat();
  }

  void _initChat() {
    _provider = ChatProvider(
      channelFactory: ChatEnvironment.channelFactory,
    );
    _controller = ChatController(
      provider: _provider,
      userName: 'Usuario',
      userEmail: 'usuario@email.com',
      client: 'farmago',
      agentName: 'Assistente',
      type: 'suporte',
    );
    Get.put<ChatController>(_controller);
  }

  @override
  void dispose() {
    Get.delete<ChatController>();
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatPageWidget(
        controller: _controller,
        contact: ChatContactModel(
          name: 'Assistente',
          isOnline: true,
        ),
      ),
    );
  }
}''',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('10. Arquivos Necessarios'),
                  _buildDescription(
                    'Importe o modulo principal para acesso a todos os componentes.',
                  ),
                  _buildCodeBlock(
                    'imports',
                    '''// Importacao unica para todos os componentes
import 'package:pharmago_chat_ui/modules/chat/chat_module.dart';

// Componentes disponiveis apos importacao:
// - ChatController
// - ChatProvider
// - ChatBinding / ChatBindingFactory
// - ChatEnvironment
// - ChatPage / ChatPageWidget
// - ChatRoutes / ChatPages
// - ChatThemeData
// - ChatContactModel
// - ChatMessageModel
// - ChatTranslations''',
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildCodeBlock(String id, String code) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surfaceContainerHighest : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outlineVariant, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? colorScheme.surfaceContainerHigh
                  : Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dart',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                InkWell(
                  onTap: () => _copyToClipboard(code),
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.copy, size: 16, color: colorScheme.primary),
                        const SizedBox(width: 4),
                        Text(
                          'Copiar',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SelectableText(
              code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: colorScheme.onSurface,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text('Codigo copiado!'),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
