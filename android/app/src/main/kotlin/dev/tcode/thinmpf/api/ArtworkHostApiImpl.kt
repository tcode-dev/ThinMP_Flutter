package dev.tcode.thinmpf.api

import ArtworkHostApi
import android.content.Context
import android.graphics.Bitmap
import android.graphics.ImageDecoder
import android.net.Uri
import dev.tcode.thinmpf.constant.MediaConstant
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream

class ArtworkHostApiImpl(private val context: Context) : ArtworkHostApi {
    override fun queryArtwork(id: String, callback: (Result<ByteArray?>) -> Unit) {
        CoroutineScope(Dispatchers.IO).launch {
            val albumArtUri = Uri.parse("${MediaConstant.ALBUM_ART}/${id}")
            val source = ImageDecoder.createSource(context.contentResolver, albumArtUri)

            try {
                val stream = ByteArrayOutputStream().use { stream ->
                    val bitmap = ImageDecoder.decodeBitmap(source)
                    bitmap.compress(Bitmap.CompressFormat.PNG, 90, stream)
                    stream.toByteArray()
                }
                withContext(Dispatchers.Main) {
                    callback(Result.success(stream))
                }
            } catch (_: Exception) {
                withContext(Dispatchers.Main) {
                    callback(Result.success(null))
                }
            }
        }
    }
}
