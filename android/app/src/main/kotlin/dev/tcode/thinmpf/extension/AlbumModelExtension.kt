package dev.tcode.thinmpf.extension

import Album
import dev.tcode.thinmpf.model.AlbumModel

fun AlbumModel.toAlbum(): Album {
    return Album(
        id = this.id.raw,
        name = this.name,
        artistId = this.artistId.raw,
        artistName = this.artistName,
        imageId = this.imageId
    )
}
