package dev.tcode.thinmpf.api

import android.content.Context
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.repository.SongRepository
import dev.tcode.thinmpf.extension.toPigeon
import dev.tcode.thinmpf.model.valueObject.SongId
import dev.tcode.thinmpf.pigeon_output.SongDTO
import dev.tcode.thinmpf.pigeon_output.SongHostApi

class SongHostApiImpl(context: Context) : SongHostApi {
    private val repository = SongRepository(context)

    override fun getAllSongs(): List<SongDTO> {
        val songs = repository.findAll()

        return songs.map { it.toPigeon() }
    }

    override fun getSongsByArtistId(artistId: String): List<SongDTO> {
        val songs = repository.findByArtistId(ArtistId(artistId))

        return songs.map { it.toPigeon() }
    }

    override fun getSongsByIds(ids: List<String>): List<SongDTO> {
        val songIds = ids.map { SongId(it) }
        val songs = repository.findByIds(songIds)

        return songs.map { it.toPigeon() }
    }

    override fun getSongsByAlbumId(albumId: String): List<SongDTO> {
        val songs = repository.findByAlbumId(AlbumId(albumId))

        return songs.map { it.toPigeon() }
    }

    override fun getSongById(id: String): SongDTO? {
        val songId = SongId(id)
        val song = repository.findById(songId) ?: return null

        return song.toPigeon()
    }
}