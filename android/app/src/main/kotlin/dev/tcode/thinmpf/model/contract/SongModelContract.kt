package dev.tcode.thinmpf.model.contract

import android.net.Uri
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.model.valueObject.SongId

interface SongModelContract {
    val id: SongId
    val name: String
    val albumId: AlbumId
    val albumName: String
    val artistId: ArtistId
    val artistName: String
    val imageId: String
    val imageUri: Uri
    val mediaUri: Uri
    val duration: Int
    val trackNumber: Double
}