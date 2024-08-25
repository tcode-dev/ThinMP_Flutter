package dev.tcode.thinmpf.player

import android.annotation.SuppressLint
import android.app.Notification
import android.app.Service
import android.content.Intent
import android.content.IntentFilter
import android.graphics.Bitmap
import android.graphics.ImageDecoder
import android.os.Binder
import android.os.IBinder
import android.os.Looper
import androidx.media3.common.MediaItem
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.common.Tracks
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaStyleNotificationHelper
import dev.tcode.thinmpf.api.PlayerFlutterApiImpl
import dev.tcode.thinmpf.constant.NotificationConstant
import dev.tcode.thinmpf.model.SongModel
import dev.tcode.thinmpf.notification.LocalNotificationHelper
import dev.tcode.thinmpf.receiver.HeadsetEventReceiver
import java.io.IOException

class MusicService : Service() {
    private val PREV_MS = 3000
    private val binder = MusicBinder()
    private lateinit var player: ExoPlayer
    private lateinit var mediaSession: MediaSession
    @SuppressLint("UnsafeOptInUsageError")
    private lateinit var mediaStyle: MediaStyleNotificationHelper.MediaStyle
    private lateinit var headsetEventReceiver: HeadsetEventReceiver
    private lateinit var playerEventListener: PlayerEventListener
    private var playingList: List<SongModel> = emptyList()
    private var initialized: Boolean = false
    private var isPlaying = false
    private var isStarting = false

    // Serviceの起動状態を確認する必要がある
    // Android13以降を対象にしているのでgetRunningServicesやLocalBroadcastManagerは使用できない
    // そのためcompanion objectでServiceの起動状態を管理する
    // アプリを再起動してもisServiceRunningは前回起動時の値のままなのでonDestroyで初期化する
    companion object {
        var isServiceRunning = false
    }

    override fun onCreate() {
        super.onCreate()

        isServiceRunning = true
        headsetEventReceiver = HeadsetEventReceiver { player.stop() }

        registerReceiver(headsetEventReceiver, IntentFilter(Intent.ACTION_HEADSET_PLUG))
    }

    fun start(songs: List<SongModel>, index: Int) {
        if (isStarting) return

        isStarting = true
        playingList = songs

        if (initialized) {
            release()
        }

        setPlayer(index)
        play()
        startFirstService()
    }

    fun play() {
        player.play()
    }

    fun pause() {
        player.pause()
    }

    fun prev() {
        if (getCurrentTime() <= PREV_MS) {
            player.seekToPrevious()
        } else {
            player.seekTo(0)
        }
    }

    fun next() {
        player.seekToNext()
    }

    fun seek(ms: Long) {
        player.seekTo(ms)
    }

    fun getCurrentTime(): Long {
        return player.currentPosition
    }

    private fun getCurrentSong(): SongModel? {
        if (player.currentMediaItem == null) return null

        return playingList.first { MediaItem.fromUri(it.mediaUri) == player.currentMediaItem }
    }

    @SuppressLint("UnsafeOptInUsageError")
    private fun setPlayer(index: Int) {
        player = ExoPlayer.Builder(applicationContext).setLooper(Looper.getMainLooper()).build()
        mediaSession = MediaSession.Builder(applicationContext, player).build()
        mediaStyle = MediaStyleNotificationHelper.MediaStyle(mediaSession)

        val mediaItems = playingList.map {
            MediaItem.fromUri(it.mediaUri)
        }

        player.setMediaItems(mediaItems)
        player.prepare()
        player.seekTo(index, 0)
        playerEventListener = PlayerEventListener()
        player.addListener(playerEventListener)
    }

    private fun startFirstService() {
        if (initialized) return

        val notification = createNotification()

        LocalNotificationHelper.createNotificationChannel(applicationContext)
        startForeground(NotificationConstant.NOTIFICATION_ID, notification)

        initialized = true
    }

    private fun seekToFirst() {
        player.seekTo(0, 0)
    }

    private fun createNotification(): Notification? {
        val song = getCurrentSong() ?: return null
        var albumArtBitmap: Bitmap? = null

        try {
            val source = ImageDecoder.createSource(contentResolver, song.imageUri)

            albumArtBitmap = ImageDecoder.decodeBitmap(source)
        } catch (_: IOException) {
        }

        return LocalNotificationHelper.createNotification(applicationContext, mediaStyle, song.name, song.artistName, albumArtBitmap)
    }

    private fun notification() {
        val notification = createNotification()

        if (notification != null) {
            LocalNotificationHelper.notify(notification, applicationContext)
        }
    }

    private fun onIsPlayingChange() {
        val playerFlutterApi = PlayerFlutterApiImpl()

        playerFlutterApi.onIsPlayingChange(player.isPlaying)
    }

    private fun onPlaybackSongChange() {
        val playerFlutterApi = PlayerFlutterApiImpl()
        val song = getCurrentSong() ?: return

        playerFlutterApi.onPlaybackSongChange(song)
    }

    private fun onError() {
//        val playerFlutterApi = PlayerFlutterApiImpl()
//
//        playerFlutterApi.onError()
    }

    private fun retry() {
        val count = playingList.count()
        val currentIndex = player.currentMediaItemIndex
        val list = playingList.toMutableList()

        list.removeAt(currentIndex)

        if (list.isNotEmpty()) {
            val nextIndex = if (count == currentIndex + 1) currentIndex -1 else currentIndex

            start(list, nextIndex)
        } else {
            isStarting = false
        }
    }

    private fun release() {
        if (isPlaying) {
            player.stop()
        }
        player.removeListener(playerEventListener)
        player.release()
        mediaSession.release()
    }

    override fun onBind(intent: Intent): IBinder {
        return binder
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_NOT_STICKY
    }

    @SuppressLint("ServiceCast")
    override fun onDestroy() {
        release()
        LocalNotificationHelper.cancelAll(applicationContext)
        unregisterReceiver(headsetEventReceiver)
        stopForeground(STOP_FOREGROUND_DETACH)
        isServiceRunning = false
    }

    inner class PlayerEventListener : Player.Listener {
        override fun onEvents(player: Player, events: Player.Events) {
            if (events.contains(Player.EVENT_POSITION_DISCONTINUITY)) return

            // onIsPlayingChangedだとシーク操作時に再生/停止ボタンの切り替えが繰り返し発生する
            if (events.contains(Player.EVENT_IS_PLAYING_CHANGED)) {
                isPlaying = player.isPlaying
                onIsPlayingChange()
            }
        }

        override fun onTracksChanged(tracks: Tracks) {
            super.onTracksChanged(tracks)
            onPlaybackSongChange()
            notification()
            isStarting = false
        }

        override fun onPlaybackStateChanged(playbackState: Int) {
            if (playbackState == Player.STATE_ENDED) {
                player.pause()
                seekToFirst()
                onIsPlayingChange()
                onPlaybackSongChange()
            }
        }

        override fun onPlayerError(error: PlaybackException) {
            // 曲が削除されている場合
            if (error.errorCode == PlaybackException.ERROR_CODE_IO_FILE_NOT_FOUND) {
                retry()
                onError()
            } else {
                isStarting = false
            }
        }
    }

    inner class MusicBinder : Binder() {
        fun getService(): MusicService = this@MusicService
    }
}