//
//  HostSongApiImpl.swift
//  Runner
//
//  Created by tk on 2024/01/25.
//

import Foundation

class HostSongApiImpl: HostSongApi {
    func findAll() throws -> [Song] {
        let song1 = Song(title: "title swift", artist: "artist swift")
        let song2 = Song(title: "title swift2", artist: "artist swift2")

        return [song1, song2]
    }
}
