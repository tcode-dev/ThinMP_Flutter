package dev.tcode.thinmpf.api

import ArtistDTO
import ArtistDetailDTO
import ArtistHostApi
import android.content.Context
import dev.tcode.thinmpf.extension.toPigeon
import dev.tcode.thinmpf.model.valueObject.ArtistId
import dev.tcode.thinmpf.repository.AlbumRepository
import dev.tcode.thinmpf.repository.ArtistRepository

class ArtistHostApiImpl(private val context: Context) : ArtistHostApi {
    private val repository = ArtistRepository(context)

    override fun getAllArtists(): List<ArtistDTO> {
        val artists = repository.findAll()

        return artists.map { it.toPigeon() }
    }

    override fun getArtistDetailById(id: String): ArtistDetailDTO? {
        val artistId = ArtistId(id)
        val artist = repository.findById(artistId)
        val albumRepository = AlbumRepository(context)
        val album = albumRepository.findFirstByArtistId(artistId)
        val name = artist?.name ?: ""
        val imageId = album?.imageId ?: ""

        return ArtistDetailDTO(id = artistId.raw, name = name, imageId = imageId)
    }

    override fun getArtistsByIds(ids: List<String>): List<ArtistDTO> {
        val artistIds = ids.map { ArtistId(it) }
        val artists = repository.findByIds(artistIds)

        return artists.map { it.toPigeon() }
    }
}