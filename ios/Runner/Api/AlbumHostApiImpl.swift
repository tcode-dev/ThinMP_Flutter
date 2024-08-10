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
    
    func getAlbumById(id: String) throws -> Album {
        let repository = AlbumRepository()

        guard let albumId = UInt64(id) else {
            throw NSError(domain: "Invalid ID", code: 1, userInfo: nil)
        }

        guard let album = repository.findById(albumId: albumId) else {
            throw NSError(domain: "Album not found", code: 2, userInfo: nil)
        }

        return Album(id: album.id, title: album.title, artist: album.artist, imageId: album.imageId)
    }
}
