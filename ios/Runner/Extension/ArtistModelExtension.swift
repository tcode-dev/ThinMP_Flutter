//
//  ArtistModelExtension.swift
//  Runner
//
//  Created by t k on 2024/08/14.
//

extension ArtistModel {
    func toPigeon() -> Artist {
        return Artist(
            id: String(self.id.raw),
            name: self.name
        )
    }
}
