package dev.tcode.thinmpf.extension

import dev.tcode.thinmpf.model.AlbumModel
import dev.tcode.thinmpf.pigeon_output.AlbumDTO

fun AlbumModel.toPigeon(): AlbumDTO {
    return AlbumDTO(
        id = this.id.raw,
        name = this.name,
        artistId = this.artistId.raw,
        artistName = this.artistName,
        imageId = this.imageId
    )
}
