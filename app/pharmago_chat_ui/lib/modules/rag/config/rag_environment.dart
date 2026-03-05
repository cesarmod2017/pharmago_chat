import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

class RagEnvironment {
  RagEnvironment._();

  static const String _debugHost = 'localhost';
  static const int _debugPort = 5003;
  static const bool _debugUseTls = false;

  static String _releaseHost = 'chat-grpc.appfarmago.com';
  static const int _releasePort = 443;
  static const bool _releaseUseTls = true;

  static String? _customHost;
  static int? _customPort;
  static bool? _customUseTls;

  static bool get isDebug => !kDebugMode;
  static bool get isRelease => kReleaseMode;

  static String get host =>
      _customHost ?? (isDebug ? _debugHost : _releaseHost);
  static int get port => _customPort ?? (isDebug ? _debugPort : _releasePort);
  static bool get useTls =>
      _customUseTls ?? (isDebug ? _debugUseTls : _releaseUseTls);

  static void configure({String? host, int? port, bool? useTls}) {
    _customHost = host;
    _customPort = port;
    _customUseTls = useTls;
  }

  static void setReleaseHost(String host) {
    _releaseHost = host;
  }

  static void reset() {
    _customHost = null;
    _customPort = null;
    _customUseTls = null;
  }

  static ClientChannel createChannel() {
    return ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
        connectionTimeout: const Duration(seconds: 30),
        idleTimeout: const Duration(minutes: 5),
      ),
    );
  }

  static Future<ClientChannel> channelFactory() async {
    return createChannel();
  }

  static String get description {
    final mode = isDebug ? 'DEBUG' : 'RELEASE';
    final tls = useTls ? 'TLS' : 'insecure';
    return '[$mode] $host:$port ($tls)';
  }
}
