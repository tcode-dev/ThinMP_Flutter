//
//  AlbumHostApiImpl.swift
//  Runner
//
//  Created by t k on 2024/08/09.
//

class AlbumHostApiImpl: AlbumHostApi {
    private let repository = AlbumRepository()
    
    func getAllAlbums() throws -> [Album] {
        let albums = repository.findAll()
        
        return albums.map { $0.toPigeon() }
    }

    func getAlbumsByArtistId(artistId: String) throws -> [Album] {
        let albums = repository.findByArtistId(artistId: ArtistId(id: artistId))
        
        return albums.map { $0.toPigeon() }
    }

    func getRecentlyAlbums(count: Int64) throws -> [Album] {
        let albums = repository.findRecently(count: Int(count))
        
        return albums.map { $0.toPigeon() }
    }

    func getAlbumById(id: String) throws -> Album? {
        guard let album = repository.findByAlbumId(albumId: AlbumId(id: id)) else {
            return nil
        }

        return album.toPigeon()
    }
}
