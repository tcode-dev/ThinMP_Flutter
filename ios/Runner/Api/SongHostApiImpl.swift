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

        return songs.map { $0.toSong() }
    }
    
    func getSongsByArtistId(artistId: String) throws -> [Song] {
        let songs = repository.findByArtistId(artistId: ArtistId(id: artistId))

        return songs.map { $0.toSong() }
    }
    
    func getSongsByAlbumId(albumId: String) throws -> [Song] {
        let songs = repository.findByAlbumId(albumId: AlbumId(id: albumId))

        return songs.map { $0.toSong() }
    }
}
