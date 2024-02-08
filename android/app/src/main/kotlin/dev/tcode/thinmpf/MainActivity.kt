package dev.tcode.thinmpf

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import dev.tcode.thinmpf.api.HostPermissionApiImpl
import dev.tcode.thinmpf.api.HostSongApiImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "dev.tcode.thinmpf/test"

    @RequiresApi(Build.VERSION_CODES.M)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        HostSongApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostSongApiImpl(this))
        HostPermissionApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HostPermissionApiImpl(this))
    //        when {
//            ContextCompat.checkSelfPermission(
//                this,
//                Manifest.permission.READ_MEDIA_AUDIO
//            ) == PackageManager.PERMISSION_GRANTED -> {
//                // You can use the API that requires the permission.
//
//            }
//            ActivityCompat.shouldShowRequestPermissionRationale(
//                this, Manifest.permission.READ_MEDIA_AUDIO) -> {
//                // In an educational UI, explain to the user why your app requires this
//                // permission for a specific feature to behave as expected, and what
//                // features are disabled if it's declined. In this UI, include a
//                // "cancel" or "no thanks" button that lets the user continue
//                // using your app without granting the permission.
////                showInContextUI(...)
//            }
//            else -> {
//                Log.d("requestPermissions", "request")
//                // You can directly ask for the permission.
//                ActivityCompat.requestPermissions(this,
//                    arrayOf(Manifest.permission.READ_MEDIA_AUDIO),
//                    123)
//            }
//        }
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
