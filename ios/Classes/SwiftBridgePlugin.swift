import Flutter
import UIKit
import Foundation

public class SwiftBridgePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bridge", binaryMessenger: registrar.messenger())
    let instance = SwiftBridgePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    print("behind47 SwiftBridgePlugin.register");
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      result("iOS " + UIDevice.current.systemVersion)
  }
}
