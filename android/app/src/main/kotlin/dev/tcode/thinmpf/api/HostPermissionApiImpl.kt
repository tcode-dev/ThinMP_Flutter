package dev.tcode.thinmpf.api

import HostPermissionApi
import android.Manifest.permission.READ_MEDIA_AUDIO
import android.content.Context
import android.content.pm.PackageManager.PERMISSION_GRANTED
import androidx.core.content.ContextCompat

class HostPermissionApiImpl(private val context: Context): HostPermissionApi {
    override fun checkPermission(): Boolean {
        return ContextCompat.checkSelfPermission(context, READ_MEDIA_AUDIO) == PERMISSION_GRANTED
    }
}