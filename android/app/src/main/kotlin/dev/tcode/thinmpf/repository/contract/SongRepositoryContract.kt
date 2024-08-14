package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.SongModel
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId

interface SongRepositoryContract {
    fun findAll(): List<SongModel>
    fun findByAlbumId(albumId: AlbumId): List<SongModel>
    fun findByArtistId(artistId: ArtistId): List<SongModel>
}