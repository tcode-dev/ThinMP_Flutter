//
//  AlbumHostApiImpl.swift
//  Runner
//
//  Created by t k on 2024/08/09.
//

class AlbumHostApiImpl: AlbumHostApi {
    private let repository = AlbumRepository()
    
    func getAllAlbums() throws -> [AlbumDTO] {
        let albums = repository.findAll()
        
        return albums.map { $0.toPigeon() }
    }

    func getAlbumsByArtistId(artistId: String) throws -> [AlbumDTO] {
        let albums = repository.findByArtistId(artistId: ArtistId(id: artistId))
        
        return albums.map { $0.toPigeon() }
    }

    func getRecentAlbums(count: Int64) throws -> [AlbumDTO] {
        let albums = repository.findRecentAlbums(count: Int(count))
        
        return albums.map { $0.toPigeon() }
    }

    func getAlbumById(id: String) throws -> AlbumDTO? {
        guard let album = repository.findByAlbumId(albumId: AlbumId(id: id)) else {
            return nil
        }

        return album.toPigeon()
    }
}
