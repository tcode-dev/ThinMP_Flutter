//
//  SongModelExtension.swift
//  Runner
//
//  Created by t k on 2024/08/14.
//

extension SongModel {
    func toSong() -> Song {
        return Song(
            id: String(self.id.raw),
            name: self.name,
            albumId: String(self.albumId.raw),
            albumName: self.albumName,
            artistId: String(self.artistId.raw),
            artistName: self.artistName,
            imageId: self.imageId,
            duration: self.duration,
            trackNumber: Double(self.trackNumber)
        )
    }
}
