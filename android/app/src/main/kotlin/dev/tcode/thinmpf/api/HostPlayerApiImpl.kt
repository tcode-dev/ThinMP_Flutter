package dev.tcode.thinmpf.api

import HostPlayerApi
import android.content.Context
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.repository.SongRepository

class HostPlayerApiImpl(private val context: Context): HostPlayerApi {
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
}