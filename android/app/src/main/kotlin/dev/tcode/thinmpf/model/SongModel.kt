package dev.tcode.thinmpf.model

import android.net.Uri
import android.provider.MediaStore
import dev.tcode.thinmpf.constant.MediaConstant
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.model.valueObject.SongId

class SongModel(
    id: String,
    name: String,
    albumId: String,
    albumName: String,
    artistId: String,
    artistName: String,
    duration: Int,
    trackNumber: String
): Music() {
    val id: SongId = SongId(id)
    val name: String = name
    val albumId: AlbumId = AlbumId(albumId)
    val albumName: String = albumName
    val artistId: ArtistId = ArtistId(artistId)
    val artistName: String = artistName
    val duration: Int = duration
    private val _trackNumber: String = trackNumber

    val imageId: String
        get() = albumId.raw

    val imageUri: Uri
        get() =  Uri.parse("${MediaConstant.ALBUM_ART}/${albumId.raw}")

    val mediaUri: Uri
        get() = Uri.parse("${MediaStore.Audio.Media.EXTERNAL_CONTENT_URI}/${id.raw}")

    val trackNumber: Double
        get() {
            // "15"、"15/30" → 15
            val regex = Regex("""\d{1,}""")
            val match = regex.find(_trackNumber) ?: return 0.0

            return match.value.toDouble()
        }
}