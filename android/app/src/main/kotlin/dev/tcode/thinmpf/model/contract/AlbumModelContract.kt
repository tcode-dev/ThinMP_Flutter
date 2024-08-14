package dev.tcode.thinmpf.model.contract

import android.net.Uri
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId

interface AlbumModelContract {
    val id: AlbumId
    val name: String
    val artistId: ArtistId
    val artistName: String
    val imageId: String
    val imageUri: Uri
}