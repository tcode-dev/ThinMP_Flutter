//
//  SongHostApiImpl.swift
//  Runner
//
//  Created by tk on 2024/01/25.
//

class SongHostApiImpl: SongHostApi {
    private let albumRepository = AlbumRepository()
    private let songRepository = SongRepository()
    
    func getAllSongs() throws -> [Song] {
        let songs = songRepository.findAll()
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByArtistId(artistId: String) throws -> [Song] {
        let albums = albumRepository.findByArtistId(artistId: ArtistId(id: artistId))
        let albumIds = albums.map { $0.id }
        let songs = songRepository.findByAlbumIds(albumIds: albumIds)

        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByAlbumId(albumId: String) throws -> [Song] {
        let songs = songRepository.findByAlbumId(albumId: AlbumId(id: albumId))
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByIds(ids: [String]) throws -> [Song] {
        let songIds = ids.map { SongId(id: $0) }
        let songs = songRepository.findBySongIds(songIds: songIds)
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongById(id: String) throws -> Song? {
        guard let song = songRepository.findBySongId(songId: SongId(id: id)) else {
            return nil
        }
        
        return song.toPigeon()
    }
}
