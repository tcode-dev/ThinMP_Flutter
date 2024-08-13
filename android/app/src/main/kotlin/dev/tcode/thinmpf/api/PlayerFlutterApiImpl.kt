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
        val playbackSong = Song(
            id = song.id.raw,
            name = song.name,
            albumId = song.albumId.raw,
            albumName = song.albumName,
            artistId = song.artistId.raw,
            artistName = song.artistName,
            imageId = song.imageId,
            duration = song.duration.toDouble(),
            trackNumber = song.trackNumber
        )

        api.onPlaybackSongChange(playbackSong) { }
    }
}