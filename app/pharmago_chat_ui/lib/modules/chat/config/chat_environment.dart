import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

/// Environment configuration for PharmaGO Chat gRPC connections.
///
/// This class provides environment-aware configuration for connecting to
/// the PharmaGo.Chat.Grpc service in different modes:
/// - Debug mode: connects to localhost
/// - Release mode: connects to production URL via port 443
class ChatEnvironment {
  /// Private constructor to prevent instantiation
  ChatEnvironment._();

  /// Debug mode localhost configuration
  static const String _debugHost = 'localhost';
  static const int _debugPort = 5003;
  static const bool _debugUseTls = false;

  /// Release mode production configuration
  /// Configure this URL before deploying to production
  static String _releaseHost = 'chat.pharmago.com.br';
  static const int _releasePort = 443;
  static const bool _releaseUseTls = true;

  /// Custom host override (for testing different environments)
  static String? _customHost;
  static int? _customPort;
  static bool? _customUseTls;

  /// Returns true if running in debug mode
  static bool get isDebug => kDebugMode;

  /// Returns true if running in release mode
  static bool get isRelease => kReleaseMode;

  /// Current host based on environment
  static String get host =>
      _customHost ?? (isDebug ? _debugHost : _releaseHost);

  /// Current port based on environment
  static int get port => _customPort ?? (isDebug ? _debugPort : _releasePort);

  /// Whether to use TLS based on environment
  static bool get useTls =>
      _customUseTls ?? (isDebug ? _debugUseTls : _releaseUseTls);

  /// Configure custom connection settings (useful for testing or staging)
  static void configure({String? host, int? port, bool? useTls}) {
    _customHost = host;
    _customPort = port;
    _customUseTls = useTls;
  }

  /// Set the production host URL
  static void setReleaseHost(String host) {
    _releaseHost = host;
  }

  /// Reset to default environment settings
  static void reset() {
    _customHost = null;
    _customPort = null;
    _customUseTls = null;
  }

  /// Creates a gRPC ClientChannel configured for the current environment
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

  /// Factory function for creating channels (for use with ChatBindingFactory)
  static Future<ClientChannel> channelFactory() async {
    return createChannel();
  }

  /// Returns a description of current environment settings
  static String get description {
    final mode = isDebug ? 'DEBUG' : 'RELEASE';
    final tls = useTls ? 'TLS' : 'insecure';
    return '[$mode] $host:$port ($tls)';
  }
}
