package dev.tcode.thinmpf.player

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import dev.tcode.thinmpf.model.SongModel

class MusicPlayer(context: Context) {
    private var musicService: MusicService? = null
    private lateinit var connection: ServiceConnection

    init {
        bindService(context)
    }

    fun isPlaying(): Boolean {
        return musicService?.isPlaying() == true
    }

    fun start(songs: List<SongModel>, index: Int) {
        musicService?.start(songs, index)
    }

    fun play() {
        musicService?.play()
    }

    fun pause() {
        musicService?.pause()
    }

    fun prev() {
        musicService?.prev()
    }

    fun next() {
        musicService?.next()
    }

    fun seekTo(ms: Long) {
        musicService?.seekTo(ms)
    }

//    fun getRepeat(): RepeatState {
//        return musicService?.getRepeat() ?: RepeatState.OFF
//    }

//    fun changeRepeat() {
//        musicService?.changeRepeat()
//    }
//
//    fun getShuffle(): Boolean {
//        return musicService?.getShuffle() ?: false
//    }
//
//    fun changeShuffle() {
//        musicService?.changeShuffle()
//    }
//
    fun getCurrentSong(): SongModel? {
        return musicService?.getCurrentSong()
    }
//
//    fun getCurrentPosition(): Long {
//        return musicService?.getCurrentPosition() ?: 0
//    }
//

    private fun bindService(context: Context) {
        context.startForegroundService(Intent(context, MusicService::class.java))
        connection = createConnection()
        context.bindService(
            Intent(context, MusicService::class.java), connection, Context.BIND_AUTO_CREATE
        )
    }

    private fun isPreparing(): Boolean {
        return musicService?.isPreparing() == true
    }

    fun unbindService(context: Context) {
        context.unbindService(connection)
        musicService = null
    }

    private fun createConnection(): ServiceConnection {
        return object : ServiceConnection {
            override fun onServiceConnected(name: ComponentName, service: IBinder) {
                val binder: MusicService.MusicBinder = service as MusicService.MusicBinder
                musicService = binder.getService()
            }

            override fun onServiceDisconnected(name: ComponentName) {}
        }
    }
}