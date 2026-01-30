import 'dart:developer' as developer;

import 'package:grpc/grpc_web.dart';

import 'chat_environment.dart';

/// Creates a gRPC-Web ClientChannel for browser environments.
/// Uses XHR transport with HTTPS for secure connections.
Future<GrpcWebClientChannel> createChatChannel() async {
  final protocol = ChatEnvironment.useTls ? 'https' : 'http';
  final uri = Uri.parse(
    '$protocol://${ChatEnvironment.host}:${ChatEnvironment.port}',
  );

  developer.log(
    'Creating gRPC-Web channel: $uri (TLS: ${ChatEnvironment.useTls})',
    name: 'ChatChannelFactory',
  );

  final channel = GrpcWebClientChannel.xhr(uri);

  developer.log(
    'gRPC-Web channel created successfully',
    name: 'ChatChannelFactory',
  );

  return channel;
}
