package dev.tcode.thinmpf.extension

import Song
import android.util.Log
import dev.tcode.thinmpf.model.SongModel

fun SongModel.toSong(): Song {
    return Song(
        id = this.id.raw,
        name = this.name,
        albumId = this.albumId.raw,
        albumName = this.albumName,
        artistId = this.artistId.raw,
        artistName = this.artistName,
        imageId = this.imageId,
        duration = this.duration.toDouble() / 1000,
        trackNumber = this.trackNumber
    )
}