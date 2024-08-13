package dev.tcode.thinmpf.repository

import android.content.ContentResolver
import android.content.Context
import android.os.Bundle
import android.provider.MediaStore
import dev.tcode.thinmpf.model.AlbumModel
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId

class AlbumRepository(context: Context) : MediaStoreRepository<AlbumModel>(
    context,
    MediaStore.Audio.Albums.EXTERNAL_CONTENT_URI,
    arrayOf(
        MediaStore.Audio.Albums._ID,
        MediaStore.Audio.Albums.ALBUM,
        MediaStore.Audio.Media.ARTIST_ID,
        MediaStore.Audio.Albums.ARTIST
    )
) {
    fun findAll(): List<AlbumModel> {
        selection = null
        selectionArgs = null
        sortOrder = MediaStore.Audio.Albums.ALBUM + " ASC"

        return getList();
    }

    fun findById(albumId: AlbumId): AlbumModel? {
        selection = MediaStore.Audio.Albums._ID + " = ?"
        selectionArgs = arrayOf(albumId.raw)
        sortOrder = null

        return get()
    }

    fun findByIds(albumIds: List<AlbumId>): List<AlbumModel> {
        val ids = albumIds.map { it.raw }

        selection = MediaStore.Audio.Albums._ID + " IN (" + makePlaceholders(ids.size) + ")"
        selectionArgs = toStringArray(ids)
        sortOrder = null

        return getList()
    }

    fun findByArtistId(artistId: ArtistId): List<AlbumModel> {
        selection = MediaStore.Audio.Media.ARTIST_ID + " = ?"
        selectionArgs = arrayOf(artistId.raw)
        sortOrder = null

        return getList()
    }

    fun findRecentlyAdded(limit: Int): List<AlbumModel> {
        selection = null
        selectionArgs = null
        bundle = Bundle().apply {
            putStringArray(
                ContentResolver.QUERY_ARG_SORT_COLUMNS,
                arrayOf(MediaStore.Audio.Artists._ID)
            )
            putInt(
                ContentResolver.QUERY_ARG_SORT_DIRECTION,
                ContentResolver.QUERY_SORT_DIRECTION_DESCENDING
            )
            putInt(ContentResolver.QUERY_ARG_LIMIT, limit)
        }

        return getList()
    }

    private fun getId(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Albums._ID)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getArtistId(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.ARTIST_ID)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getArtistName(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.ARTIST)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getAlbumName(): String {
        return cursor?.getColumnIndex(MediaStore.Audio.Media.ALBUM)?.let { cursor?.getString(it) } ?: ""
    }

    private fun getAlbum(): AlbumModel {
        return AlbumModel(
            id = getId(),
            name = getAlbumName(),
            artistId = getArtistId(),
            artistName = getArtistName(),
        )
    }

    override fun fetch(): AlbumModel {
        return getAlbum()
    }
}