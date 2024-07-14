package dev.tcode.thinmpf.api

import HostArtworkApi
import android.content.Context
import android.graphics.Bitmap
import android.graphics.ImageDecoder
import android.net.Uri
import android.os.Build
import androidx.annotation.RequiresApi
import dev.tcode.thinmpf.constant.MediaConstant
import java.io.ByteArrayOutputStream

class HostArtworkApiImpl(private val context: Context) : HostArtworkApi {
    @RequiresApi(Build.VERSION_CODES.P)
    override fun queryArtwork(id: String): ByteArray? {
        val albumArtUri = Uri.parse("${MediaConstant.ALBUM_ART}/${id}")
        val source = ImageDecoder.createSource(context.contentResolver, albumArtUri)
        val bitmap = ImageDecoder.decodeBitmap(source)
        val stream = ByteArrayOutputStream()

        bitmap.compress(Bitmap.CompressFormat.PNG, 90, stream)

        return stream.toByteArray()
    }
}