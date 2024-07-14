package dev.tcode.thinmpf.api

import HostSongApi
import Song
import android.content.Context
import dev.tcode.thinmpf.repository.SongRepository

class HostSongApiImpl(private val context: Context) : HostSongApi {
    override fun findAll(): List<Song> {
        val repository = SongRepository(context)
        val result = repository.findAll()

        return result.map {
            Song(it.id, it.name, it.artistName, it.albumId)
        }
    }
}