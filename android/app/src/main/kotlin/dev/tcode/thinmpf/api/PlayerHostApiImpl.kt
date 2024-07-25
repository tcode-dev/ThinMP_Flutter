package dev.tcode.thinmpf.api

import PlaybackState
import PlayerHostApi
import android.content.Context
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.repository.SongRepository

class PlayerHostApiImpl(private val context: Context): PlayerHostApi {
    override fun startBySongs(index: Long) {
        val repository = SongRepository(context)
        val songs = repository.findAll()
        val musicPlayer = MusicPlayer()

        musicPlayer.start(context, songs, index.toInt())
    }

    override fun play() {
        TODO("Not yet implemented")
    }

    override fun stop() {
        TODO("Not yet implemented")
    }

    override fun getPlaybackState(): PlaybackState {
        TODO("Not yet implemented")
    }
}