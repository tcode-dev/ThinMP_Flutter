package dev.tcode.thinmpf.api

import HostSongApi
import Song

class HostSongApiImpl: HostSongApi {
    override fun findAll(): List<Song> {
        val song1 = Song("title1", "artist1")
        val song2 = Song("title2", "artist2")

        return listOf(song1, song2)
    }
}