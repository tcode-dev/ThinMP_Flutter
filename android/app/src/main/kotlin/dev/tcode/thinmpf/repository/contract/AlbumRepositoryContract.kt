package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.AlbumModel
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId

interface AlbumRepositoryContract {
    fun findAll(): List<AlbumModel>
    fun findByAlbumId(albumId: AlbumId): AlbumModel?
    fun findByArtistId(artistId: ArtistId): List<AlbumModel>
}