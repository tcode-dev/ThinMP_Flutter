package dev.tcode.thinmpf.model

import dev.tcode.thinmpf.model.contract.ArtistModelContract
import dev.tcode.thinmpf.model.valueObject.ArtistId

class ArtistModel(
    id: String,
    name: String
): ArtistModelContract {
    override val id: ArtistId = ArtistId(id)
    override val name: String = name
}
