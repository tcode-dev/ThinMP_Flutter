//
//  ArtistRepository.swift
//  Runner
//
//  Created by t k on 2024/08/10.
//

import MediaPlayer

class ArtistRepository: ArtistRepositoryContract {
    func findAll() -> [ArtistModel] {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.artists()

        query.addFilterPredicate(property)

        return query.collections!.map { ArtistModel(media: $0)}
    }
}
