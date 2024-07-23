package dev.tcode.thinmpf.api

import ArtworkHostApi
import android.content.Context
import android.graphics.Bitmap
import android.graphics.ImageDecoder
import android.net.Uri
import dev.tcode.thinmpf.constant.MediaConstant
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.io.ByteArrayOutputStream

class ArtworkHostApiImpl(private val context: Context) : ArtworkHostApi {
    @OptIn(DelicateCoroutinesApi::class)
    override fun queryArtwork(id: String, callback: (Result<ByteArray?>) -> Unit) {
        GlobalScope.launch {
            val albumArtUri = Uri.parse("${MediaConstant.ALBUM_ART}/${id}")
            val source = ImageDecoder.createSource(context.contentResolver, albumArtUri)
            val bitmap = ImageDecoder.decodeBitmap(source)
            val stream = ByteArrayOutputStream()

            bitmap.compress(Bitmap.CompressFormat.PNG, 90, stream)

            callback(Result.success(stream.toByteArray()))
        }
    }
}