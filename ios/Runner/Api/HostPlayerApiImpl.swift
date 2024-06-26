//
//  HostPlayerApiImpl.swift
//  Runner
//
//  Created by tk on 2024/06/25.
//

import Foundation
import UIKit

class HostPlayerApiImpl: HostPlayerApi {
    func startBySongs(index: Int64) throws {
        let repository = SongRepository()
        let songs = repository.findAll()

        MusicPlayer.shared.start(list: songs, currentIndex: Int(index))
    }
    
    func play() throws {
        
    }
    
    func stop() throws {
        
    }
}
