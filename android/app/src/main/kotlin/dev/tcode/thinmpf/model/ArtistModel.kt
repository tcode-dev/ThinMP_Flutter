package dev.tcode.thinmpf.model

import dev.tcode.thinmpf.model.valueObject.ArtistId

class ArtistModel(
    id: String,
    name: String,

): Music() {
    val id: ArtistId = ArtistId(id)
    val name: String = name
}
