package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.SongModel
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.model.valueObject.SongId

interface SongRepositoryContract {
    fun findAll(): List<SongModel>
    fun findById(songId: SongId): SongModel?
    fun findByIds(songIds: List<SongId>): List<SongModel>
    fun findByAlbumId(albumId: AlbumId): List<SongModel>
    fun findByArtistId(artistId: ArtistId): List<SongModel>
}