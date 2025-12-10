abstract class ChatTranslations {
  static const Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'pt_BR': ptBR,
    'es_ES': esES,
  };

  static const Map<String, String> enUS = {
    'chat_error_init_session': 'Failed to start chat session',
    'chat_error_connection': 'Connection error. Please try again.',
    'chat_error_send_message': 'Failed to send message. Please try again.',
    'chat_error_load_history': 'Failed to load message history.',
    'chat_input_placeholder': 'Type a message...',
    'chat_online': 'Online',
    'chat_offline': 'Offline',
    'chat_typing': 'Typing...',
    'chat_empty_conversation': 'Start a conversation',
    'chat_yesterday': 'Yesterday',
  };

  static const Map<String, String> ptBR = {
    'chat_error_init_session': 'Falha ao iniciar sessão de chat',
    'chat_error_connection': 'Erro de conexão. Por favor, tente novamente.',
    'chat_error_send_message':
        'Falha ao enviar mensagem. Por favor, tente novamente.',
    'chat_error_load_history': 'Falha ao carregar histórico de mensagens.',
    'chat_input_placeholder': 'Digite uma mensagem...',
    'chat_online': 'Online',
    'chat_offline': 'Offline',
    'chat_typing': 'Digitando...',
    'chat_empty_conversation': 'Inicie uma conversa',
    'chat_yesterday': 'Ontem',
  };

  static const Map<String, String> esES = {
    'chat_error_init_session': 'Error al iniciar sesión de chat',
    'chat_error_connection': 'Error de conexión. Por favor, inténtelo de nuevo.',
    'chat_error_send_message':
        'Error al enviar mensaje. Por favor, inténtelo de nuevo.',
    'chat_error_load_history': 'Error al cargar historial de mensajes.',
    'chat_input_placeholder': 'Escribe un mensaje...',
    'chat_online': 'En línea',
    'chat_offline': 'Desconectado',
    'chat_typing': 'Escribiendo...',
    'chat_empty_conversation': 'Iniciar conversación',
    'chat_yesterday': 'Ayer',
  };
}
