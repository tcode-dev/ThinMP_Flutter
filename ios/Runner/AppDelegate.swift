import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

        HostSongApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: HostSongApiImpl())
        HostPlayerApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: HostPlayerApiImpl())

        let player = MusicPlayer()

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
