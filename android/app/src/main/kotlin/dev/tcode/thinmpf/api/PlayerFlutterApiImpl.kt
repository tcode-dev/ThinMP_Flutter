package dev.tcode.thinmpf.api

import dev.tcode.thinmpf.extension.toPigeon
import dev.tcode.thinmpf.model.contract.SongModelContract
import dev.tcode.thinmpf.pigeon_output.PlayerFlutterApi
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

    fun onPlaybackSongChange(song: SongModelContract) {
        api.onPlaybackSongChange(song.toPigeon()) { }
    }
}