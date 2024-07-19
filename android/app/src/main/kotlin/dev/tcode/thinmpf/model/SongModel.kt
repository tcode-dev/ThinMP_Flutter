package dev.tcode.thinmpf.model

import android.net.Uri
import android.provider.MediaStore

class SongModel(
    val songId: String,
    public override var name: String,
    val artistId: String,
    val artistName: String,
    val albumId: String,
    val albumName: String,
    val duration: Int,
    val trackNumber: String
): Music() {
    override var id: String = ""
//        get() = songId.id
        get() = songId

//    fun getImageUri(): Uri {
//        return Uri.parse("${MediaConstant.ALBUM_ART}/${albumId.id}")
//    }

    val mediaUri
        get() = Uri.parse("${MediaStore.Audio.Media.EXTERNAL_CONTENT_URI}/${id}")

//    fun getTrackNumber(): Int {
//        // "15"、"15/30" → 15
//        val regex = Regex("""\d{1,}""")
//        val match = regex.find(trackNumber) ?: return 0
//
//        return match.value.toInt()
//    }
}