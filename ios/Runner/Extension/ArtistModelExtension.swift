//
//  ArtistModelExtension.swift
//  Runner
//
//  Created by t k on 2024/08/14.
//

extension ArtistModelContract {
    func toPigeon() -> ArtistDTO {
        return ArtistDTO(
            id: String(self.id.raw),
            name: self.name
        )
    }
}
