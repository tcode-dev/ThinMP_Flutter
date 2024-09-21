//
//  SongHostApiImpl.swift
//  Runner
//
//  Created by tk on 2024/01/25.
//

class SongHostApiImpl: SongHostApi {
    private let albumRepository = AlbumRepository()
    private let songRepository = SongRepository()
    
    func getAllSongs() throws -> [SongDTO] {
        let songs = songRepository.findAll()
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByArtistId(artistId: String) throws -> [SongDTO] {
        let albums = albumRepository.findByArtistId(artistId: ArtistId(id: artistId))
        let albumIds = albums.map { $0.id }
        let songs = songRepository.findByAlbumIds(albumIds: albumIds)

        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByAlbumId(albumId: String) throws -> [SongDTO] {
        let songs = songRepository.findByAlbumId(albumId: AlbumId(id: albumId))
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongsByIds(ids: [String]) throws -> [SongDTO] {
        let songIds = ids.map { SongId(id: $0) }
        let songs = songRepository.findBySongIds(songIds: songIds)
        
        return songs.map { $0.toPigeon() }
    }
    
    func getSongById(id: String) throws -> SongDTO? {
        guard let song = songRepository.findBySongId(songId: SongId(id: id)) else {
            return nil
        }
        
        return song.toPigeon()
    }
}
