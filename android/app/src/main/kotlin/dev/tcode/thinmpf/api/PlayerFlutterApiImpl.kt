package dev.tcode.thinmpf.api

import PlaybackState
import PlayerFlutterApi
import io.flutter.plugin.common.BinaryMessenger

class PlayerFlutterApiImpl {
    companion object {
        lateinit var api: PlayerFlutterApi
        fun setUp(binaryMessenger: BinaryMessenger) {
            api = PlayerFlutterApi(binaryMessenger)
        }
    }

    fun onPlaybackStateChange(state: PlaybackState) {
        api.onPlaybackStateChange(state) { }
    }
}