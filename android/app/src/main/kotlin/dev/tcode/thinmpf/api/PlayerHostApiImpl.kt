package dev.tcode.thinmpf.api

import PlayerHostApi
import android.content.Context
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.repository.SongRepository

class PlayerHostApiImpl(private val context: Context): PlayerHostApi {
    private var player = MusicPlayer(context)

    override fun startBySongs(index: Long) {
        val repository = SongRepository(context)
        val songs = repository.findAll()

        player.start(songs, index.toInt())
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
}