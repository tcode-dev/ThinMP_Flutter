package dev.tcode.thinmpf.api

import CurrentSong
import PlaybackState
import PlayerHostApi
import android.content.Context
import android.util.Log
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
        val musicPlayer = MusicPlayer()

        musicPlayer.play()
    }

    override fun pause() {
        val musicPlayer = MusicPlayer()

        musicPlayer.pause()
    }

    override fun prev() {
        val musicPlayer = MusicPlayer()

        musicPlayer.prev()
    }

    override fun next() {
        val musicPlayer = MusicPlayer()

        musicPlayer.next()
    }

    override fun getPlaybackState(): PlaybackState {
        val musicPlayer = MusicPlayer()
        val song = musicPlayer.getCurrentSong()
        val currentSong = if (song != null) CurrentSong(song.id, song.name, song.artistName, song.albumId) else null

        return PlaybackState(isPlaying = true, song = currentSong)
    }
}