import 'package:flutter_test/flutter_test.dart';
import 'package:bridge/bridge.dart';
import 'package:bridge/bridge_platform_interface.dart';
import 'package:bridge/bridge_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBridgePlatform 
    with MockPlatformInterfaceMixin
    implements BridgePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BridgePlatform initialPlatform = BridgePlatform.instance;

  test('$MethodChannelBridge is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBridge>());
  });

  test('getPlatformVersion', () async {
    Bridge bridgePlugin = Bridge();
    MockBridgePlatform fakePlatform = MockBridgePlatform();
    BridgePlatform.instance = fakePlatform;
  
    expect(await bridgePlugin.getPlatformVersion(), '42');
  });
}
