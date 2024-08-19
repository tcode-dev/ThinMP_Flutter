//
//  AlbumModelExtension.swift
//  Runner
//
//  Created by t k on 2024/08/14.
//

extension AlbumModel {
    func toPigeon() -> Album {
        return Album(
            id: String(self.id.raw),
            name: self.name,
            artistId: String(self.artistId.raw),
            artistName: self.artistName,
            imageId: self.imageId
        )
    }
}
