package dev.tcode.thinmpf.api

import android.content.Context
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.model.valueObject.SongId
import dev.tcode.thinmpf.pigeon_output.PlayerHostApi
import dev.tcode.thinmpf.pigeon_output.RepeatMode
import dev.tcode.thinmpf.pigeon_output.ShuffleMode
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.repository.SongRepository

class PlayerHostApiImpl(private val context: Context): PlayerHostApi {
    override fun start(index: Long, ids: List<String>, repeatMode: RepeatMode, shuffleMode: ShuffleMode) {
        val repository = SongRepository(context)
        val songIds = ids.map { SongId(it) }
        val songs = repository.findByIds(songIds)

        MusicPlayer.start(songs, index.toInt(), repeatMode, shuffleMode)
    }

    override fun startAllSongs(index: Long, repeatMode: RepeatMode, shuffleMode: ShuffleMode) {
        val repository = SongRepository(context)
        val songs = repository.findAll()

        MusicPlayer.start(songs, index.toInt(), repeatMode, shuffleMode)
    }

    override fun startAlbumSongs(index: Long, albumId: String, repeatMode: RepeatMode, shuffleMode: ShuffleMode) {
        val repository = SongRepository(context)
        val songs = repository.findByAlbumId(AlbumId(albumId))

        MusicPlayer.start(songs, index.toInt(), repeatMode, shuffleMode)
    }

    override fun startArtistSongs(index: Long, artistId: String, repeatMode: RepeatMode, shuffleMode: ShuffleMode) {
        val repository = SongRepository(context)
        val songs = repository.findByArtistId(ArtistId(artistId))

        MusicPlayer.start(songs, index.toInt(), repeatMode, shuffleMode)
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

    override fun setRepeat(repeatMode: RepeatMode) {
        MusicPlayer.setRepeat(repeatMode)
    }

    override fun setShuffle(shuffleMode: ShuffleMode) {
        MusicPlayer.setShuffle(shuffleMode)
    }

    override fun getCurrentTime(): Double {
        return MusicPlayer.getCurrentTime().toDouble() / 1000
    }
}