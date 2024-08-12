//
//  AlbumHostApiImpl.swift
//  Runner
//
//  Created by t k on 2024/08/09.
//

import Foundation

class AlbumHostApiImpl: AlbumHostApi {
    func getAllAlbums() throws -> [Album] {
        let repository = AlbumRepository()
        let albums = repository.findAll()

        return albums.map { album in
            return Album(id: album.id, title: album.title, artist: album.artist, imageId: album.imageId)
        }
    }
    
    func getAlbumsByArtistId(artistId: String) throws -> [Album] {
        let repository = AlbumRepository()
        let albums = repository.findByArtistId(artistId: ArtistId(id: artistId))

        return albums.map { album in
            return Album(id: album.id, title: album.title, artist: album.artist, imageId: album.imageId)
        }
    }

    func getAlbumById(id: String) throws -> Album? {
        let repository = AlbumRepository()

        guard let album = repository.findById(albumId: AlbumId(id: id)) else {
            return nil
        }

        return Album(id: album.id, title: album.title, artist: album.artist, imageId: album.imageId)
    }
}
