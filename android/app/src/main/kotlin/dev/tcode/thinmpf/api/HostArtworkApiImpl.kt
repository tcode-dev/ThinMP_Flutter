package dev.tcode.thinmpf.api

import HostArtworkApi
import android.content.Context
import android.graphics.Bitmap
import android.graphics.ImageDecoder
import android.net.Uri
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dev.tcode.thinmpf.constant.MediaConstant
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch
import java.io.ByteArrayOutputStream

class HostArtworkApiImpl(private val context: Context) : ViewModel(), HostArtworkApi {
    @RequiresApi(Build.VERSION_CODES.P)
    override fun queryArtwork(id: String, callback: (Result<ByteArray?>) -> Unit) {
        viewModelScope.launch {
            val albumArtUri = Uri.parse("${MediaConstant.ALBUM_ART}/${id}")
            val source = ImageDecoder.createSource(context.contentResolver, albumArtUri)
            val bitmap = ImageDecoder.decodeBitmap(source)
            val stream = ByteArrayOutputStream()

            bitmap.compress(Bitmap.CompressFormat.PNG, 90, stream)

            callback(Result.success(stream.toByteArray()))
        }
    }
}

//class HostArtworkApiImpl(private val context: Context) : HostArtworkApi {
//    @RequiresApi(Build.VERSION_CODES.P)
//    override fun queryArtwork(id: String, callback: (Result<ByteArray?>) -> Unit) {
//        val artwork = Artwork(context)
//
//        artwork.queryArtwork(id, context, callback)
//    }
//}
//
//class Artwork(override val coroutineContext: Context) : CoroutineScope {
//    @RequiresApi(Build.VERSION_CODES.P)
//    fun queryArtwork(id: String, context: Context, callback: (Result<ByteArray?>) -> Unit) {
//        launch {
//            val albumArtUri = Uri.parse("${MediaConstant.ALBUM_ART}/${id}")
//            val source = ImageDecoder.createSource(context.contentResolver, albumArtUri)
//            val bitmap = ImageDecoder.decodeBitmap(source)
//            val stream = ByteArrayOutputStream()
//
//            bitmap.compress(Bitmap.CompressFormat.PNG, 90, stream)
//
//            callback(Result.success(stream.toByteArray()))
//        }
//    }
//}