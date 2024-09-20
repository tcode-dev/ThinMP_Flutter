package dev.tcode.thinmpf.extension

import ArtistDTO
import dev.tcode.thinmpf.model.ArtistModel

fun ArtistModel.toPigeon(): ArtistDTO {
    return ArtistDTO(
        id = this.id.raw,
        name = this.name,
    )
}
