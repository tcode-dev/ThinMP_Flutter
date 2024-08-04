package dev.tcode.thinmpf.api

import Song
import SongHostApi
import android.content.Context
import dev.tcode.thinmpf.repository.SongRepository

class SongHostApiImpl(private val context: Context) : SongHostApi {
    override fun getAllSongs(): List<Song> {
        val repository = SongRepository(context)
        val result = repository.findAll()

        return result.map {
            Song(it.id, it.name, it.artistName, it.albumId)
        }
    }
}