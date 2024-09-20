package dev.tcode.thinmpf.api

import AlbumDTO
import AlbumHostApi
import android.content.Context
import dev.tcode.thinmpf.model.valueObject.AlbumId
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.repository.AlbumRepository
import dev.tcode.thinmpf.extension.toPigeon

class AlbumHostApiImpl(context: Context) : AlbumHostApi {
    private val repository = AlbumRepository(context)

    override fun getAllAlbums(): List<AlbumDTO> {
        val albums = repository.findAll()

        return albums.map { it.toPigeon() }
    }

    override fun getAlbumsByArtistId(artistId: String): List<AlbumDTO> {
        val albums = repository.findByArtistId(ArtistId(artistId))

        return albums.map { it.toPigeon() }
    }

    override fun getRecentAlbums(count: Long): List<AlbumDTO> {
        val albums = repository.findRecentAlbums(count.toInt())

        return albums.map { it.toPigeon() }
    }

    override fun getAlbumById(id: String): AlbumDTO? {
        val album = repository.findByAlbumId(AlbumId(id))

        return album?.toPigeon()
    }
}