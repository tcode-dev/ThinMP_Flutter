package dev.tcode.thinmpf.api

import PlayerHostApi
import android.content.Context
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.repository.SongRepository

class PlayerHostApiImpl(private val context: Context): PlayerHostApi {
    private var player = MusicPlayer(context)

    override fun startAllSongs(index: Long) {
        val repository = SongRepository(context)
        val songs = repository.findAll()

        player.start(songs, index.toInt())
    }

    override fun startAlbumSongs(index: Long, albumId: String) {
        val repository = SongRepository(context)
        val songs = repository.findByAlbumId(AlbumId(albumId))

        player.start(songs, index.toInt())
    }

    override fun startArtistSongs(index: Long, artistId: String) {
        val repository = SongRepository(context)
        val songs = repository.findByArtistId(ArtistId(artistId))

        player.start(songs, index.toInt())
    }

    override fun play() {
        player.play()
    }

    override fun pause() {
        player.pause()
    }

    override fun prev() {
        player.prev()
    }

    override fun next() {
        player.next()
    }

    override fun seek(time: Double) {
        player.seek(time.toLong() * 1000)
    }

    override fun getCurrentTime(): Double {
        return player.getCurrentTime().toDouble() / 1000
    }
}