package dev.tcode.thinmpf.repository.contract

import dev.tcode.thinmpf.model.contract.SongModelContract
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.model.valueObject.SongId

interface SongRepositoryContract {
    fun findAll(): List<SongModelContract>

    fun findById(songId: SongId): SongModelContract?

    fun findByIds(songIds: List<SongId>): List<SongModelContract>

    fun findByAlbumId(albumId: AlbumId): List<SongModelContract>

    fun findByArtistId(artistId: ArtistId): List<SongModelContract>
}