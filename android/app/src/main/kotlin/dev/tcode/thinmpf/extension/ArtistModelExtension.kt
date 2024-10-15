package dev.tcode.thinmpf.extension

import dev.tcode.thinmpf.model.contract.ArtistModelContract
import dev.tcode.thinmpf.pigeon_output.ArtistDTO

fun ArtistModelContract.toPigeon(): ArtistDTO {
    return ArtistDTO(
        id = this.id.raw,
        name = this.name,
    )
}
