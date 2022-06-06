import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bridge_method_channel.dart';

abstract class BridgePlatform extends PlatformInterface {
  /// Constructs a BridgePlatform.
  BridgePlatform() : super(token: _token);

  static final Object _token = Object();

  static BridgePlatform _instance = MethodChannelBridge();

  /// The default instance of [BridgePlatform] to use.
  ///
  /// Defaults to [MethodChannelBridge].
  static BridgePlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BridgePlatform] when
  /// they register themselves.
  static set instance(BridgePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
