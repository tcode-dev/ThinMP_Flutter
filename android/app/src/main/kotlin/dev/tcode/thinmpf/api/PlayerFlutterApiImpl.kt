package dev.tcode.thinmpf.api

import PlayerFlutterApi
import Song
import dev.tcode.thinmpf.model.SongModel
import io.flutter.plugin.common.BinaryMessenger

class PlayerFlutterApiImpl {
    companion object {
        lateinit var api: PlayerFlutterApi
        fun setUp(binaryMessenger: BinaryMessenger) {
            api = PlayerFlutterApi(binaryMessenger)
        }
    }

    fun onIsPlayingChange(isPlaying: Boolean) {
        api.onIsPlayingChange(isPlaying) { }
    }

    fun onPlaybackSongChange(song: SongModel) {
        val playbackSong = Song(song.id, song.name, song.artistName, song.imageId, song.duration.toDouble())

        api.onPlaybackSongChange(playbackSong) { }
    }
}