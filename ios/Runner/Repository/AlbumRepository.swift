//
//  AlbumRepository.swift
//  Runner
//
//  Created by t k on 2024/08/09.
//

import MediaPlayer

class AlbumRepository: AlbumRepositoryContract {
    func findAll() -> [AlbumModel] {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.albums()

        query.addFilterPredicate(property)

        return query.collections!.map { AlbumModel(media: $0) }
    }

    func findById(albumId: UInt64) -> AlbumModel? {
        print(albumId)
        let property = MPMediaPropertyPredicate(value: albumId, forProperty: MPMediaItemPropertyAlbumPersistentID)
        let query = MPMediaQuery.albums()

        query.addFilterPredicate(property)

        return query.collections!.map { AlbumModel(media: $0) }.first
    }

    func findByArtistId(artistId: ArtistId) -> [AlbumModel] {
        let property = MPMediaPropertyPredicate(value: artistId.id, forProperty: MPMediaItemPropertyArtistPersistentID)
        let query = MPMediaQuery.albums()

        query.addFilterPredicate(property)

        return query.collections!.sorted(by: { String($0.representativeItem?.albumTitle ?? "") < String($1.representativeItem?.albumTitle ?? "") })
            .map { AlbumModel(media: $0) }
    }
}
