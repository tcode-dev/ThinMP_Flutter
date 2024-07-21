package dev.tcode.thinmpf

import dev.tcode.thinmpf.api.HostArtworkApiImpl
import dev.tcode.thinmpf.api.HostPlayerApiImpl
import dev.tcode.thinmpf.api.HostSongApiImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        HostArtworkApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostArtworkApiImpl(this))
        HostPlayerApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostPlayerApiImpl(this))
        HostSongApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostSongApiImpl(this))
    }
}
