import Flutter
import UIKit

public class SwiftScreenInteractiveDetectorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screen_interactive_detector", binaryMessenger: registrar.messenger())
    let instance = SwiftScreenInteractiveDetectorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
      case "isInteractive":
        return result(UIScreen.main.brightness != 0.0)
      default:
        return result(FlutterMethodNotImplemented)
    }
  }
}
