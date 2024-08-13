package dev.tcode.thinmpf.model

import android.net.Uri
import dev.tcode.thinmpf.constant.MediaConstant
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId

class AlbumModel(
    id: String,
    name: String,
    artistId: String,
    artistName: String
): Music() {
    val id: AlbumId = AlbumId(id)
    val name: String = name
    val artistId: ArtistId = ArtistId(artistId)
    val artistName: String = artistName

    val imageId: String
        get() = id.raw

    val imageUri: Uri
        get() =  Uri.parse("${MediaConstant.ALBUM_ART}/${id.raw}")
}
