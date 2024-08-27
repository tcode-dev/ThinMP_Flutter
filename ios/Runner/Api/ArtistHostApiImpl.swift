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
        let artistId = ArtistId(id: id)
        let albumRepository = AlbumRepository()
        let artist = repository.findById(artistId: artistId)
        
        if (artist == nil) {
            return nil
        }

        let album = albumRepository.findFirstByArtistId(artistId: artistId)
        let name = artist?.name ?? ""
        let imageId = album?.imageId ?? ""

        return ArtistDetail(id: id, name: name, imageId: imageId)
    }
}
