#import "BridgePlugin.h"
#if __has_include(<bridge/bridge-Swift.h>)
#import <bridge/bridge-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bridge-Swift.h"
#endif

@implementation BridgePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBridgePlugin registerWithRegistrar:registrar];
}
@end
