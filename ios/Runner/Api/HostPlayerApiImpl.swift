//
//  HostPlayerApiImpl.swift
//  Runner
//
//  Created by tk on 2024/06/25.
//

import Foundation

class HostPlayerApiImpl: HostPlayerApi {
    func startBySongs(index: Int) {
        let repository = SongRepository()
        let songs = repository.findAll()
        let app = (UIApplication.sharedApplication().delegate as! AppDelegate)

        app.player.start(songs, index)
    }
    
    func play() {
        
    }
    
    func stop() {
        
    }
}
