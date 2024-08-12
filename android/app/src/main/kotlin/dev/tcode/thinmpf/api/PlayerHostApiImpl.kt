package dev.tcode.thinmpf.api

import PlayerHostApi
import android.content.Context
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.repository.SongRepository

class PlayerHostApiImpl(private val context: Context): PlayerHostApi {
    private var player = MusicPlayer(context)

    override fun startAllSongs(index: Long) {
        val repository = SongRepository(context)
        val songs = repository.findAll()

        player.start(songs, index.toInt())
    }

    override fun startAlbumSongs(index: Long, albumId: String) {
        TODO("Not yet implemented")
    }

    override fun startArtistSongs(index: Long, artistId: String) {
        TODO("Not yet implemented")
    }

    override fun play() {
        player.play()
    }

    override fun pause() {
        player.pause()
    }

    override fun prev() {
        player.prev()
    }

    override fun next() {
        player.next()
    }

    override fun seek(time: Double) {
        TODO("Not yet implemented")
    }

    override fun getCurrentTime(): Double {
        TODO("Not yet implemented")
    }
}