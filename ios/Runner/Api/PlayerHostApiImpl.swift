//
//  PlayerHostApiImpl.swift
//  Runner
//
//  Created by tk on 2024/06/25.
//

import Foundation
import UIKit

class PlayerHostApiImpl: PlayerHostApi {
    func startAllSongs(index: Int64) throws {
        let repository = SongRepository()
        let songs = repository.findAll()

        MusicPlayer.shared.start(list: songs, currentIndex: Int(index))
    }

    func startAlbumSongs(index: Int64, albumId: String) throws {
        let repository = SongRepository()
        let songs = repository.findByAlbumId(albumId: AlbumId(id: albumId))

        MusicPlayer.shared.start(list: songs, currentIndex: Int(index))
    }

    func startArtistSongs(index: Int64, artistId: String) throws {
        let repository = SongRepository()
        let songs = repository.findByArtistId(artistId: ArtistId(id: artistId))

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

    func getCurrentTime() throws -> Double {
        return MusicPlayer.shared.getCurrentTime()
    }
}
