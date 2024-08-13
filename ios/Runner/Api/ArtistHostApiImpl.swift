//
//  ArtistHostApiImpl.swift
//  Runner
//
//  Created by t k on 2024/08/10.
//

class ArtistHostApiImpl: ArtistHostApi {
    private let repository = ArtistRepository()

    func getAllArtists() throws -> [Artist] {
        let artists = repository.findAll()

        return artists.map { artist in
            Artist(
                id: String(artist.id.raw),
                name: artist.name
            )
        }
    }
}
