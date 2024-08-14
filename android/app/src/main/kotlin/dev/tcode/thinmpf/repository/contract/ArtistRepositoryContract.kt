package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.ArtistModel

interface ArtistRepositoryContract {
    fun findAll(): List<ArtistModel>
}