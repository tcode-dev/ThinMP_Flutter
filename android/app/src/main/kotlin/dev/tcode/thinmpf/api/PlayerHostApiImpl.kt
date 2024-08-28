package dev.tcode.thinmpf.api

import PlayerHostApi
import RepeatState
import android.content.Context
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.repository.SongRepository

class PlayerHostApiImpl(private val context: Context): PlayerHostApi {
    override fun startAllSongs(index: Long) {
        val repository = SongRepository(context)
        val songs = repository.findAll()

        MusicPlayer.start(songs, index.toInt())
    }

    override fun startAlbumSongs(index: Long, albumId: String) {
        val repository = SongRepository(context)
        val songs = repository.findByAlbumId(AlbumId(albumId))

        MusicPlayer.start(songs, index.toInt())
    }

    override fun startArtistSongs(index: Long, artistId: String) {
        val repository = SongRepository(context)
        val songs = repository.findByArtistId(ArtistId(artistId))

        MusicPlayer.start(songs, index.toInt())
    }

    override fun play() {
        MusicPlayer.play()
    }

    override fun pause() {
        MusicPlayer.pause()
    }

    override fun prev() {
        MusicPlayer.prev()
    }

    override fun next() {
        MusicPlayer.next()
    }

    override fun seek(time: Double) {
        MusicPlayer.seek(time.toLong() * 1000)
    }

    override fun setRepeat(repeatState: RepeatState) {
        MusicPlayer.setRepeat(repeatState)
    }

    override fun setShuffle(isShuffle: Boolean) {
        MusicPlayer.setShuffle(isShuffle)
    }

    override fun getCurrentTime(): Double {
        return MusicPlayer.getCurrentTime().toDouble() / 1000
    }
}