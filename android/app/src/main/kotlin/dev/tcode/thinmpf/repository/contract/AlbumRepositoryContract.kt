package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.contract.AlbumModelContract
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId

interface AlbumRepositoryContract {
    fun findAll(): List<AlbumModelContract>

    fun findByAlbumId(albumId: AlbumId): AlbumModelContract?

    fun findByArtistId(artistId: ArtistId): List<AlbumModelContract>

    fun findFirstByArtistId(artistId: ArtistId): AlbumModelContract?

    fun findRecentAlbums(limit: Int): List<AlbumModelContract>
}