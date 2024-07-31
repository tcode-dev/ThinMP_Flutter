//
//  PlayerHostApiImpl.swift
//  Runner
//
//  Created by tk on 2024/06/25.
//

import Foundation
import UIKit

class PlayerHostApiImpl: PlayerHostApi {
    func startBySongs(index: Int64) throws {
        let repository = SongRepository()
        let songs = repository.findAll()

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

    func getPlaybackState() throws -> PlaybackState {
        if let song = MusicPlayer.shared.getCurrentSong() {
            let song2 = Song2(id: song.id, title: song.primaryText, artist: song.secondaryText, imageId: song.id)
            return PlaybackState(isPlaying: false, song: song2)
        } else {
            return PlaybackState(isPlaying: false, song: nil)
        }
    }
}
