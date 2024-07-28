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
        
    }
    
    func pause() throws {
        
    }
    
    func prev() throws {
        
    }

    func next() throws {
        
    }

    func getPlaybackState() throws -> PlaybackState {
        return PlaybackState(isPlaying: false, song: nil)
    }
}
