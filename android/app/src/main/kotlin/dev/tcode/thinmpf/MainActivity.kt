package dev.tcode.thinmpf

import android.os.Build
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import dev.tcode.thinmpf.api.HostArtworkApiImpl
import dev.tcode.thinmpf.api.HostPermissionApiImpl
import dev.tcode.thinmpf.api.HostSongApiImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    @RequiresApi(Build.VERSION_CODES.M)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        HostArtworkApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostArtworkApiImpl(this))
        HostPermissionApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostPermissionApiImpl(this))
        HostSongApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostSongApiImpl(this))
    }
}
