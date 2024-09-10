package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.ArtistModel
import dev.tcode.thinmpf.model.valueObject.ArtistId

interface ArtistRepositoryContract {
    fun findAll(): List<ArtistModel>
    fun findById(artistId: ArtistId): ArtistModel?
    fun findByIds(artistIds: List<ArtistId>): List<ArtistModel>
}