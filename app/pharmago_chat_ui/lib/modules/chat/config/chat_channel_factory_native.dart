import 'dart:developer' as developer;

import 'package:grpc/grpc.dart';
import 'chat_environment.dart';

/// Creates a gRPC ClientChannel for native platforms (Windows, Android, iOS, macOS, Linux).
/// Uses HTTP/2 with TLS for secure connections.
Future<ClientChannel> createChatChannel() async {
  developer.log(
    'Creating gRPC channel: ${ChatEnvironment.host}:${ChatEnvironment.port} (TLS: ${ChatEnvironment.useTls})',
    name: 'ChatChannelFactory',
  );

  final channel = ClientChannel(
    ChatEnvironment.host,
    port: ChatEnvironment.port,
    options: ChannelOptions(
      credentials: ChatEnvironment.useTls
          ? ChannelCredentials.secure(
              onBadCertificate: (certificate, host) {
                // In debug mode, accept self-signed certificates
                return ChatEnvironment.isDebug;
              },
            )
          : const ChannelCredentials.insecure(),
      connectionTimeout: const Duration(seconds: 30),
      idleTimeout: const Duration(minutes: 5),
      keepAlive: const ClientKeepAliveOptions(
        pingInterval: Duration(seconds: 30),
        timeout: Duration(seconds: 20),
        permitWithoutCalls: true,
      ),
    ),
  );

  developer.log(
    'gRPC channel created successfully',
    name: 'ChatChannelFactory',
  );

  return channel;
}
