//
//  ArtistRepository.swift
//  Runner
//
//  Created by t k on 2024/08/10.
//

import MediaPlayer

class ArtistRepository: ArtistRepositoryContract {
    func findAll() -> [ArtistModelContract] {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.artists()

        query.addFilterPredicate(property)

        return query.collections!.map { ArtistModel(media: $0)}
    }

    func findById(artistId: ArtistId) -> ArtistModelContract? {
        let property = MPMediaPropertyPredicate(value: artistId.raw, forProperty: MPMediaItemPropertyArtistPersistentID)
        let query = MPMediaQuery.artists()

        query.addFilterPredicate(property)

        guard let artist = query.collections?.first else {
            return nil
        }

        return ArtistModel(media: artist)
    }
    
    func findByIds(artistIds: [ArtistId]) -> [ArtistModelContract] {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.artists()
        let ids = artistIds.map { $0.raw }

        query.addFilterPredicate(property)

        let filtered = query.collections!.filter {
            if let artistPersistentId = $0.representativeItem?.artistPersistentID {
                return ids.contains(artistPersistentId)
            }
            return false
        }

        return artistIds
            .filter { artistId in filtered.contains(where: { $0.representativeItem?.artistPersistentID == artistId.raw }) }
            .map { artistId in filtered.first { $0.representativeItem?.artistPersistentID == artistId.raw }!}
            .map { ArtistModel(media: $0) }
    }
}
