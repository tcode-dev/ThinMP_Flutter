package dev.tcode.thinmpf.extension

import Artist
import dev.tcode.thinmpf.model.ArtistModel

fun ArtistModel.toArtist(): Artist {
    return Artist(
        id = this.id.raw,
        name = this.name,
    )
}
