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

        return artists.map { $0.toPigeon() }
    }
    
    func getArtistDetailById(id: String) throws -> ArtistDetail? {
        return nil
    }
}
