package dev.tcode.thinmpf.model.contract

import dev.tcode.thinmpf.model.valueObject.ArtistId

interface ArtistModelContract {
    val id: ArtistId
    val name: String
}