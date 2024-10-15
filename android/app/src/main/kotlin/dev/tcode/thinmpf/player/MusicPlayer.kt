package dev.tcode.thinmpf.player

import android.annotation.SuppressLint
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import dev.tcode.thinmpf.model.contract.SongModelContract
import dev.tcode.thinmpf.pigeon_output.RepeatMode
import dev.tcode.thinmpf.pigeon_output.ShuffleMode

@SuppressLint("StaticFieldLeak")
object MusicPlayer{
    private lateinit var context: Context
    private var musicService: MusicService? = null
    private var connection: ServiceConnection? = null
    private var isServiceBinding = false
    private var bound = false

    fun initialize(context: Context) {
        this.context = context.applicationContext
    }

    fun start(songs: List<SongModelContract>, index: Int) {
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

    fun setRepeat(repeatMode: RepeatMode) {
        musicService?.setRepeat(repeatMode)
    }

    fun setShuffle(shuffleMode: ShuffleMode) {
        musicService?.setShuffle(shuffleMode)
    }

    fun getCurrentTime(): Long {
        return musicService?.getCurrentTime() ?: 0
    }

    fun dispose() {
        if (!MusicService.isServiceRunning) return

        unbindService()

        val musicServiceIntent = Intent(context, MusicService::class.java)

        context.stopService(musicServiceIntent)
    }

    private fun isServiceRunning(): Boolean {
        return MusicService.isServiceRunning
    }

    private fun bindService(context: Context, callback: () -> Unit? = {}) {
        isServiceBinding = true
        connection = createConnection(callback)
        context.bindService(
            Intent(context, MusicService::class.java), connection!!, Context.BIND_AUTO_CREATE
        )
    }

    private fun unbindService() {
        connection?.let {
            context.unbindService(it)
            connection = null
        }
        musicService = null
        bound = false
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