package dev.tcode.thinmpf.api

import Album
import AlbumHostApi
import android.content.Context
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.repository.AlbumRepository
import dev.tcode.thinmpf.extension.toAlbum

class AlbumHostApiImpl(context: Context) : AlbumHostApi {
    private val repository = AlbumRepository(context)

    override fun getAllAlbums(): List<Album> {
        val albums = repository.findAll()

        return albums.map { it.toAlbum() }
    }

    override fun getAlbumsByArtistId(artistId: String): List<Album> {
        val albums = repository.findByArtistId(ArtistId(artistId))

        return albums.map { it.toAlbum() }
    }

    override fun getAlbumById(id: String): Album? {
        val album = repository.findByAlbumId(AlbumId(id))

        return album?.toAlbum()
    }
}