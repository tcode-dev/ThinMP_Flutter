package dev.tcode.thinmpf.extension

import Album
import Song
import dev.tcode.thinmpf.model.AlbumModel
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
        duration = this.duration.toDouble(),
        trackNumber = this.trackNumber
    )
}

fun AlbumModel.toAlbum(): Album {
    return Album(
        id = this.id.raw,
        name = this.name,
        artistId = this.artistId.raw,
        artistName = this.artistName,
        imageId = this.imageId
    )
}