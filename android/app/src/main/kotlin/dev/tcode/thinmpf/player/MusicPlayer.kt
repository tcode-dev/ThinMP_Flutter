package dev.tcode.thinmpf.player

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.annotation.RequiresApi
import dev.tcode.thinmpf.model.SongModel

//import dev.tcode.thinmp.player.MusicServiceListener


interface MusicPlayerListener : MusicServiceListener {
    fun onBind() {}
}

class MusicPlayer() {
    private var musicService: MusicService? = null
    private lateinit var connection: ServiceConnection
    private var isConnecting = false
    private var bound = false

    fun isServiceRunning(): Boolean {
        return MusicService.isServiceRunning
    }

    fun isPlaying(): Boolean {
        return musicService?.isPlaying() == true
    }

    fun start(context: Context, songs: List<SongModel>, index: Int) {
        if (isConnecting) return
        if (isPreparing()) return

        if (!isServiceRunning()) {
            context.startForegroundService(Intent(context, MusicService::class.java))
            bindService(context) {
                Log.d("MusicPlayer", "callback")
                musicService?.start(songs, index)
            }
            return
        }

        if (!bound) {
            bindService(context)

            return
        }

        musicService?.start(songs, index)
    }

    fun play() {
        musicService?.play()
    }

    fun pause() {
        musicService?.pause()
    }

    fun prev() {
//        musicService?.prev()
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
//    fun getCurrentSong(): SongModel? {
//        return musicService?.getCurrentSong()
//    }
//
//    fun getCurrentPosition(): Long {
//        return musicService?.getCurrentPosition() ?: 0
//    }
//
//    fun destroy(context: Context) {
//        musicService?.removeEventListener(listener)
//
//        unbindService(context)
//    }

    private fun bindService(context: Context, callback: () -> Unit? = {}) {
        Log.d("MusicPlayer", "bindService1")
        if (isConnecting || bound) return
        Log.d("MusicPlayer", "bindService2")
        isConnecting = true
        connection = createConnection(callback)
        context.bindService(
            Intent(context, MusicService::class.java), connection, Context.BIND_AUTO_CREATE
        )
    }

    private fun isPreparing(): Boolean {
        return musicService?.isPreparing() == true
    }

    private fun unbindService(context: Context) {
        if (!bound) return

        context.unbindService(connection)
        musicService = null
        bound = false
    }

    private fun createConnection(callback: () -> Unit? = {}): ServiceConnection {
        return object : ServiceConnection {
            override fun onServiceConnected(name: ComponentName, service: IBinder) {
                Log.d("MusicPlayer", "onServiceConnected")
                val binder: MusicService.MusicBinder = service as MusicService.MusicBinder
                musicService = binder.getService()
//                musicService!!.addEventListener(listener)
                callback()
//                listener.onBind()
                isConnecting = false
                bound = true
            }

            override fun onServiceDisconnected(name: ComponentName) {}
        }
    }
}