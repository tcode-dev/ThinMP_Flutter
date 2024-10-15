package dev.tcode.thinmpf.model

import android.net.Uri
import android.provider.MediaStore
import dev.tcode.thinmpf.constant.MediaConstant
import dev.tcode.thinmpf.model.contract.SongModelContract
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
): SongModelContract {
    private val trackNumberRaw: String = trackNumber
    override val id: SongId = SongId(id)
    override val name: String = name
    override val albumId: AlbumId = AlbumId(albumId)
    override val albumName: String = albumName
    override val artistId: ArtistId = ArtistId(artistId)
    override val artistName: String = artistName
    override val duration: Int = duration

    override val imageId: String
        get() = albumId.raw

    override val imageUri: Uri
        get() =  Uri.parse("${MediaConstant.ALBUM_ART}/${albumId.raw}")

    override val mediaUri: Uri
        get() = Uri.parse("${MediaStore.Audio.Media.EXTERNAL_CONTENT_URI}/${id.raw}")

    override val trackNumber: Double
        get() {
            // "15"、"15/30" → 15
            val regex = Regex("""\d{1,}""")
            val match = regex.find(trackNumberRaw)

            return match?.value?.toDouble() ?: 0.0
        }
}