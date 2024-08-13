package dev.tcode.thinmpf.api

import Song
import SongHostApi
import android.content.Context
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.repository.SongRepository
import dev.tcode.thinmpf.extension.toSong

class SongHostApiImpl(context: Context) : SongHostApi {
    private val repository = SongRepository(context)

    override fun getAllSongs(): List<Song> {
        val songs = repository.findAll()

        return songs.map { it.toSong() }
    }

    override fun getSongsByArtistId(artistId: String): List<Song> {
        val songs = repository.findByArtistId(ArtistId(artistId))

        return songs.map { it.toSong() }
    }

    override fun getSongsByAlbumId(albumId: String): List<Song> {
        val songs = repository.findByAlbumId(AlbumId(albumId))

        return songs.map { it.toSong() }
    }
}