package dev.tcode.thinmpf.api

import CurrentSong
import PlaybackState
import PlayerFlutterApi
import dev.tcode.thinmpf.model.SongModel
import io.flutter.plugin.common.BinaryMessenger

class PlayerFlutterApiImpl {
    companion object {
        lateinit var api: PlayerFlutterApi
        fun setUp(binaryMessenger: BinaryMessenger) {
            api = PlayerFlutterApi(binaryMessenger)
        }
    }

    fun onPlaybackStateChange(isPlaying: Boolean, song: SongModel?) {
        val currentSong = if (song != null) CurrentSong(song.id, song.name, song.artistName, song.albumId) else null
        val playbackState = PlaybackState(isPlaying, currentSong)

        api.onPlaybackStateChange(playbackState) { }
    }
}