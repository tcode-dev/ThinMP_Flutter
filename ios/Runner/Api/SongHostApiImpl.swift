//
//  SongHostApiImpl.swift
//  Runner
//
//  Created by tk on 2024/01/25.
//

class SongHostApiImpl: SongHostApi {
    private let repository = SongRepository()
    
    func getAllSongs() throws -> [Song] {
        let songs = repository.findAll()
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByArtistId(artistId: String) throws -> [Song] {
        let songs = repository.findByArtistId(artistId: ArtistId(id: artistId))
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByAlbumId(albumId: String) throws -> [Song] {
        let songs = repository.findByAlbumId(albumId: AlbumId(id: albumId))
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByIds(ids: [String]) throws -> [Song] {
        let songIds = ids.map { SongId(id: $0) }
        let songs = repository.findBySongIds(songIds: songIds)
        
        return songs.map { $0.toPigeon() }
    }
}
