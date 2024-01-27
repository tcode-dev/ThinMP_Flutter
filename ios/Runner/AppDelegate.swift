import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//        let channel = FlutterMethodChannel(name: "dev.tcode.thinmpf/test",
//                                           binaryMessenger: controller.binaryMessenger)
//        channel.setMethodCallHandler({
//            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
//            switch call.method {
//            case "getSongs" :
//                result(["Hello from Swift!", "test"])
//            default :
//                result(["default from Swift!"])
//            }
//        })
        HostSongApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: HostSongApiImpl())

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
