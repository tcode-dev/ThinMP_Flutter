package dev.tcode.thinmpf

import PlayerFlutterApi
import dev.tcode.thinmpf.api.ArtworkHostApiImpl
import dev.tcode.thinmpf.api.PlayerFlutterApiImpl
import dev.tcode.thinmpf.api.PlayerHostApiImpl
import dev.tcode.thinmpf.api.SongHostApiImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // HostApi
        ArtworkHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, ArtworkHostApiImpl(this))
        PlayerHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, PlayerHostApiImpl(this))
        SongHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, SongHostApiImpl(this))

        // FlutterApi
        PlayerFlutterApiImpl.setUp(flutterEngine.dartExecutor.binaryMessenger)
    }
}
