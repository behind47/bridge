import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bridge_platform_interface.dart';

/// An implementation of [BridgePlatform] that uses method channels.
class MethodChannelBridge extends BridgePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bridge');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
