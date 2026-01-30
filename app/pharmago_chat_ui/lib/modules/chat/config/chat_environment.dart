import 'package:flutter/foundation.dart';
import 'chat_channel_factory.dart' as channel_factory;

/// Environment configuration for PharmaGO Chat gRPC connections.
///
/// This class provides environment-aware configuration for connecting to
/// the PharmaGo.Chat.Grpc service in different modes:
/// - Debug mode: connects to localhost
/// - Release mode: connects to production URL via port 443
///
/// Supports multiple platforms:
/// - Web: Uses GrpcWebClientChannel with XHR transport
/// - Native (Windows, Android, iOS, macOS, Linux): Uses ClientChannel with HTTP/2
class ChatEnvironment {
  /// Private constructor to prevent instantiation
  ChatEnvironment._();

  /// Debug mode localhost configuration
  static const String _debugHost = 'localhost';
  static const int _debugPort = 5003;
  static const bool _debugUseTls = false;

  /// Release mode production configuration
  /// Configure this URL before deploying to production
  static String _releaseHost = 'chat-grpc.appfarmago.com';
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

  /// Returns true if running on web platform
  static bool get isWeb => kIsWeb;

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

  /// Factory function for creating channels (for use with ChatBindingFactory).
  /// Automatically selects the correct channel type based on platform:
  /// - Web: GrpcWebClientChannel
  /// - Native: ClientChannel
  static Future<dynamic> channelFactory() async {
    return channel_factory.createChatChannel();
  }

  /// Returns a description of current environment settings
  static String get description {
    final mode = isDebug ? 'DEBUG' : 'RELEASE';
    final tls = useTls ? 'TLS' : 'insecure';
    final platform = isWeb ? 'Web' : 'Native';
    return '[$mode] $host:$port ($tls) - $platform';
  }
}
