
import 'bridge_platform_interface.dart';

class Bridge {
  Future<String?> getPlatformVersion() {
    return BridgePlatform.instance.getPlatformVersion();
  }
}
