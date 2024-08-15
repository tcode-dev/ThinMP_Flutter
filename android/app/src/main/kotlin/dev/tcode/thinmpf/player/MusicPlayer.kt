package dev.tcode.thinmpf.player

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import dev.tcode.thinmpf.model.SongModel

class MusicPlayer(var context: Context) {
    private var musicService: MusicService? = null
    private lateinit var connection: ServiceConnection
    private var isServiceBinding = false
    private var bound = false

    fun start(songs: List<SongModel>, index: Int) {
        if (!isServiceRunning()) {
            if (isServiceBinding) return

            context.startForegroundService(Intent(context, MusicService::class.java))
            bindService(context) { musicService?.start(songs, index) }

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
        musicService?.prev()
    }

    fun next() {
        musicService?.next()
    }

    fun seek(ms: Long) {
        musicService?.seek(ms)
    }

    fun getCurrentTime(): Long {
        return musicService?.getCurrentTime() ?: 0
    }

    private fun isServiceRunning(): Boolean {
        return MusicService.isServiceRunning
    }

    private fun bindService(context: Context, callback: () -> Unit? = {}) {
        isServiceBinding = true
        connection = createConnection(callback)
        context.bindService(
            Intent(context, MusicService::class.java), connection, Context.BIND_AUTO_CREATE
        )
    }

    fun unbindService(context: Context) {
        context.unbindService(connection)
        musicService = null
    }

    private fun createConnection(callback: () -> Unit? = {}): ServiceConnection {
        return object : ServiceConnection {
            override fun onServiceConnected(name: ComponentName, service: IBinder) {
                val binder: MusicService.MusicBinder = service as MusicService.MusicBinder
                musicService = binder.getService()
                callback()
                isServiceBinding = false
                bound = true
            }

            override fun onServiceDisconnected(name: ComponentName) {}
        }
    }
}