package dev.tcode.thinmpf

import dev.tcode.thinmpf.api.AlbumHostApiImpl
import dev.tcode.thinmpf.api.ArtistHostApiImpl
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
        AlbumHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, AlbumHostApiImpl(this))
        ArtistHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, ArtistHostApiImpl(this))
        ArtworkHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, ArtworkHostApiImpl(this))
        PlayerHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, PlayerHostApiImpl(this))
        SongHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, SongHostApiImpl(this))

        // FlutterApi
        PlayerFlutterApiImpl.setUp(flutterEngine.dartExecutor.binaryMessenger)
    }
}
