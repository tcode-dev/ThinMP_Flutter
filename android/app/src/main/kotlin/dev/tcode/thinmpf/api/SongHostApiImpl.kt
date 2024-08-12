package dev.tcode.thinmpf.api

import Song
import SongHostApi
import android.content.Context
import dev.tcode.thinmpf.repository.SongRepository

class SongHostApiImpl(private val context: Context) : SongHostApi {
    override fun getAllSongs(): List<Song> {
        val repository = SongRepository(context)
        val songs = repository.findAll()

        return songs.map {
            Song(it.id, it.name, it.artistName, it.imageId, it.duration.toDouble())
        }
    }

    override fun getSongsByArtistId(artistId: String): List<Song> {
        TODO("Not yet implemented")
    }

    override fun getSongsByAlbumId(albumId: String): List<Song> {
        TODO("Not yet implemented")
    }
}