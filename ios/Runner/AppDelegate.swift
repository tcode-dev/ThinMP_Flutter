import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

        // HostApi
        AlbumHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: AlbumHostApiImpl())
        ArtworkHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: ArtworkHostApiImpl())
        PlayerHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: PlayerHostApiImpl())
        SongHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: SongHostApiImpl())

        // FlutterApi
        PlayerFlutterApiImpl.setup(binaryMessenger: controller.binaryMessenger)

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
