//
//  SongHostApiImpl.swift
//  Runner
//
//  Created by tk on 2024/01/25.
//

import Foundation

class SongHostApiImpl: SongHostApi {
    func getAllSongs() throws -> [Song] {
        let repository = SongRepository()
        let songs = repository.findAll()

        return songs.map { song in
            return Song(id: song.id, title: song.primaryText, artist: song.secondaryText, imageId: song.id)
        }
    }
}
