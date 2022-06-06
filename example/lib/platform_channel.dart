import 'dart:ffi';

import 'package:flutter/services.dart';

class PlatformChannel {
  static const String platformChannelName = 'platform';
  late MethodChannel _platform;

  // factory PlatformChannel(String name) => PlatformChannel._internal(name);

  static final PlatformChannel _instance = PlatformChannel().._platform = const MethodChannel(platformChannelName);

  static PlatformChannel get instance => _instance;

  // PlatformChannel._internal(String name) : _platform = MethodChannel(name);

  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = 'Failed to get battery level: "${e.message}".';
    }
    return batteryLevel;
  }

  Future<String?> getPlatformVersion() {
    return _platform.invokeMethod('getPlatformVersion');
  }

  Future<Void> test() async {
    return await _platform.invokeMethod('test');
  }
}