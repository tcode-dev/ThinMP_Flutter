package dev.tcode.thinmpf.extension

import dev.tcode.thinmpf.model.ArtistModel
import dev.tcode.thinmpf.pigeon_output.ArtistDTO

fun ArtistModel.toPigeon(): ArtistDTO {
    return ArtistDTO(
        id = this.id.raw,
        name = this.name,
    )
}
