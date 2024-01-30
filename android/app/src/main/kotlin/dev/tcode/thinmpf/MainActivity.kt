package dev.tcode.thinmpf

import androidx.annotation.NonNull
import dev.tcode.thinmpf.api.HostSongApiImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "dev.tcode.thinmpf/test"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        HostSongApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostSongApiImpl(this))
//        MethodChannel(
//            flutterEngine.dartExecutor.binaryMessenger,
//            CHANNEL
//        ).setMethodCallHandler { call, result ->
//            when (call.method) {
//                "getSongs" ->
//                    result.success(listOf("Hello from Kotlin!","testtest"))
//                else ->
//                    result.success("")
//            }
//        }
    }
}
