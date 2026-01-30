/// Platform-aware gRPC channel factory for PharmaGO Chat.
///
/// This file exports the appropriate channel factory based on the platform:
/// - Web: Uses GrpcWebClientChannel with XHR transport
/// - Native (Windows, Android, iOS, macOS, Linux): Uses ClientChannel with HTTP/2
///
/// Usage:
/// ```dart
/// import 'chat_channel_factory.dart';
///
/// final channel = await createChatChannel();
/// final client = ChatServiceClient(channel);
/// ```
export 'chat_channel_factory_web.dart'
    if (dart.library.io) 'chat_channel_factory_native.dart';
