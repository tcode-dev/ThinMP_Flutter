package dev.tcode.thinmpf.api

import HostSongApi
import Song
import android.content.Context
import dev.tcode.thinmpf.repository.SongRepository

class HostSongApiImpl(private val context: Context): HostSongApi {
    override fun findAll(): List<Song> {
//        val song1 = Song("title1", "artist1")
//        val song2 = Song("title2", "artist2")
        val repository = SongRepository(context)
        val result = repository.findAll()
        val songs = result.map{
            Song(it.name, it.artistName)
        }
//        return listOf(song1, song2)
        return songs
    }
}