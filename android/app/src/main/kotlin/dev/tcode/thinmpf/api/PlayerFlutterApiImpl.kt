package dev.tcode.thinmpf.api

import PlayerFlutterApi
import dev.tcode.thinmpf.extension.toPigeon
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
        api.onPlaybackSongChange(song.toPigeon()) { }
    }
}