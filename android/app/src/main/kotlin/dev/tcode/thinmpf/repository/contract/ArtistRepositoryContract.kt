package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.contract.ArtistModelContract
import dev.tcode.thinmpf.model.valueObject.ArtistId

interface ArtistRepositoryContract {
    fun findAll(): List<ArtistModelContract>

    fun findById(artistId: ArtistId): ArtistModelContract?

    fun findByIds(artistIds: List<ArtistId>): List<ArtistModelContract>
}