package dev.tcode.thinmpf

import android.app.Activity
import android.app.Application
import android.content.Intent
import android.os.Bundle
import dev.tcode.thinmpf.player.MusicPlayer
import dev.tcode.thinmpf.player.MusicService

class MainApplication : Application(), Application.ActivityLifecycleCallbacks {

    override fun onCreate() {
        super.onCreate()
        registerActivityLifecycleCallbacks(this)
        MusicPlayer.initialize(this)
    }

    override fun onActivityCreated(p0: Activity, p1: Bundle?) {}

    override fun onActivityStarted(p0: Activity) {}

    override fun onActivityResumed(p0: Activity) {}

    override fun onActivityPaused(p0: Activity) {}

    override fun onActivityStopped(p0: Activity) {}

    override fun onActivitySaveInstanceState(p0: Activity, p1: Bundle) {}

    override fun onActivityDestroyed(p0: Activity) {
        MusicPlayer.dispose()
    }
}