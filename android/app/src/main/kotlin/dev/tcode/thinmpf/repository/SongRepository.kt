package dev.tcode.thinmpf.repository

import android.content.Context
import android.provider.MediaStore
import android.util.Log
import dev.tcode.thinmpf.model.SongModel
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.repository.contract.SongRepositoryContract

class SongRepository(context: Context) : SongRepositoryContract, MediaStoreRepository<SongModel>(
    context, MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, arrayOf(
        MediaStore.Audio.Media._ID,
        MediaStore.Audio.Media.TITLE,
        MediaStore.Audio.Media.ARTIST_ID,
        MediaStore.Audio.Media.ARTIST,
        MediaStore.Audio.Media.ALBUM_ID,
        MediaStore.Audio.Media.ALBUM,
        MediaStore.Audio.Media.DURATION,
        MediaStore.Audio.Media.CD_TRACK_NUMBER
    )
) {
    override fun findAll(): List<SongModel> {
        selection = MediaStore.Audio.Media.IS_MUSIC + " = 1"
        selectionArgs = null
        sortOrder = (MediaStore.Audio.Media.ARTIST + " ASC, " + MediaStore.Audio.Media.ALBUM + " ASC, " + MediaStore.Audio.Media._ID + " ASC")

        return getList()
    }

    override fun findByAlbumId(albumId: AlbumId): List<SongModel> {
        selection = MediaStore.Audio.Media.ALBUM_ID + " = ? AND " + MediaStore.Audio.Media.IS_MUSIC + " = 1"
        selectionArgs = arrayOf(albumId.raw)

        return getList()
    }

    override fun findByArtistId(artistId: ArtistId): List<SongModel> {
        selection = MediaStore.Audio.Media.ARTIST_ID + " = ? AND " + MediaStore.Audio.Media.IS_MUSIC + " = 1"
        selectionArgs = arrayOf(artistId.raw)
        sortOrder = MediaStore.Audio.Media.ALBUM + " ASC, " + MediaStore.Audio.Media._ID + " ASC"
        return getList()
    }

    private fun getId(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media._ID)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getTitle(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.TITLE)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getArtistId(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.ARTIST_ID)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getArtistName(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.ARTIST)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getAlbumId(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.ALBUM_ID)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getAlbumName(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.ALBUM)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getDuration(): Int {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.DURATION)?.let { cursor?.getInt(it) } ?: 0
    }

    private fun getTrackNumber(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.CD_TRACK_NUMBER)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getSong(): SongModel {
        return SongModel(
            id = getId(),
            name = getTitle(),
            albumId = getAlbumId(),
            albumName = getAlbumName(),
            artistId = getArtistId(),
            artistName = getArtistName(),
            duration = getDuration(),
            trackNumber = getTrackNumber()
        )
    }

    override fun fetch(): SongModel {
        return getSong()
    }
}