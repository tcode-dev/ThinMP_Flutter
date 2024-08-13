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
        
        return albums.map { $0.toAlbum() }
    }

    func getAlbumsByArtistId(artistId: String) throws -> [Album] {
        let albums = repository.findByArtistId(artistId: ArtistId(id: artistId))
        
        return albums.map { $0.toAlbum() }
    }

    func getAlbumById(id: String) throws -> Album? {
        guard let album = repository.findByAlbumId(albumId: AlbumId(id: id)) else {
            return nil
        }

        return album.toAlbum()
    }
}
