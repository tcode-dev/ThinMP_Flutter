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
        
        return songs.map { song in
            Song(
                id: String(song.id.raw),
                name: song.name,
                albumId: String(song.albumId.raw),
                albumName: song.albumName,
                artistId: String(song.artistId.raw),
                artistName: song.artistName,
                imageId: song.imageId,
                duration: song.duration,
                trackNumber: Double(song.duration)
            )
        }
    }
    
    func getSongsByArtistId(artistId: String) throws -> [Song] {
        let songs = repository.findByArtistId(artistId: ArtistId(id: artistId))

        return songs.map { song in
            Song(
                id: String(song.id.raw),
                name: song.name,
                albumId: String(song.albumId.raw),
                albumName: song.albumName,
                artistId: String(song.artistId.raw),
                artistName: song.artistName,
                imageId: song.imageId,
                duration: song.duration,
                trackNumber: Double(song.duration)
            )
        }
    }
    
    func getSongsByAlbumId(albumId: String) throws -> [Song] {
        let songs = repository.findByAlbumId(albumId: AlbumId(id: albumId))

        return songs.map { song in
            Song(
                id: String(song.id.raw),
                name: song.name,
                albumId: String(song.albumId.raw),
                albumName: song.albumName,
                artistId: String(song.artistId.raw),
                artistName: song.artistName,
                imageId: song.imageId,
                duration: song.duration,
                trackNumber: Double(song.duration)
            )
        }
    }
}
