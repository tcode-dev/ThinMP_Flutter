//
//  PlayerHostApiImpl.swift
//  Runner
//
//  Created by tk on 2024/06/25.
//

class PlayerHostApiImpl: PlayerHostApi {
    private let albumRepository = AlbumRepository()
    private let songRepository = SongRepository()

    func start(index: Int64, ids: [String]) throws {
        let songIds = ids.map { SongId(id: $0) }
        let songs = songRepository.findBySongIds(songIds: songIds)

        MusicPlayer.shared.start(list: songs, currentIndex: Int(index))
    }

    func startAllSongs(index: Int64) throws {
        let songs = songRepository.findAll()

        MusicPlayer.shared.start(list: songs, currentIndex: Int(index))
    }

    func startAlbumSongs(index: Int64, albumId: String) throws {
        let songs = songRepository.findByAlbumId(albumId: AlbumId(id: albumId))

        MusicPlayer.shared.start(list: songs, currentIndex: Int(index))
    }

    func startArtistSongs(index: Int64, artistId: String) throws {
        let albums = albumRepository.findByArtistId(artistId: ArtistId(id: artistId))
        let albumIds = albums.map { $0.id }
        let songs = songRepository.findByAlbumIds(albumIds: albumIds)

        MusicPlayer.shared.start(list: songs, currentIndex: Int(index))
    }

    func play() throws {
        MusicPlayer.shared.play()
    }
    
    func pause() throws {
        MusicPlayer.shared.pause()
    }
    
    func prev() throws {
        MusicPlayer.shared.prev()
    }

    func next() throws {
        MusicPlayer.shared.next()
    }

    func seek(time: Double) throws {
        MusicPlayer.shared.seek(time: time)
    }

    func setRepeat(repeatMode: RepeatMode) throws {
        MusicPlayer.shared.setRepeat(repeatMode: repeatMode)
    }

    func setShuffle(shuffleMode: ShuffleMode) throws {
        MusicPlayer.shared.setShuffle(shuffleMode: shuffleMode)
    }

    func getCurrentTime() throws -> Double {
        return MusicPlayer.shared.getCurrentTime()
    }
}
