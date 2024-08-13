package dev.tcode.thinmpf.api

import Artist
import ArtistHostApi
import android.content.Context
import dev.tcode.thinmpf.repository.ArtistRepository

class ArtistHostApiImpl(context: Context) : ArtistHostApi {
    private val repository = ArtistRepository(context)

    override fun getAllArtists(): List<Artist> {
        val artists = repository.findAll()

        return artists.map {
            Artist(
                id = it.id.raw,
                name = it.name,
            )
        }
    }
}