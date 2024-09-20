package dev.tcode.thinmpf.extension

import AlbumDTO
import dev.tcode.thinmpf.model.AlbumModel

fun AlbumModel.toPigeon(): AlbumDTO {
    return AlbumDTO(
        id = this.id.raw,
        name = this.name,
        artistId = this.artistId.raw,
        artistName = this.artistName,
        imageId = this.imageId
    )
}
