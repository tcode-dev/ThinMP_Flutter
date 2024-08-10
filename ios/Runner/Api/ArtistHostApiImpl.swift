//
//  ArtistHostApiImpl.swift
//  Runner
//
//  Created by t k on 2024/08/10.
//

import Foundation

class ArtistHostApiImpl: ArtistHostApi {
    func getAllArtists() throws -> [Artist] {
        let repository = ArtistRepository()
        let artists = repository.findAll()

        return artists.map { artist in
            return Artist(id: artist.id, artist: artist.artist)
        }
    }
}
