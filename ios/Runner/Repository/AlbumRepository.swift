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

    func findByAlbumId(albumId: AlbumId) -> AlbumModel? {
        let property = MPMediaPropertyPredicate(value: albumId.raw, forProperty: MPMediaItemPropertyAlbumPersistentID)
        let query = MPMediaQuery.albums()

        query.addFilterPredicate(property)

        return query.collections!.map { AlbumModel(media: $0) }.first
    }

    func findByArtistId(artistId: ArtistId) -> [AlbumModel] {
        let property = MPMediaPropertyPredicate(value: artistId.raw, forProperty: MPMediaItemPropertyArtistPersistentID)
        let query = MPMediaQuery.albums()

        query.addFilterPredicate(property)

        return query.collections!.sorted(by: { String($0.representativeItem?.albumTitle ?? "") < String($1.representativeItem?.albumTitle ?? "") })
            .map { AlbumModel(media: $0) }
    }

    func findRecently(count: Int) -> [AlbumModel] {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.albums()

        query.addFilterPredicate(property)

        return query.collections!.sorted(by: { left, right in
            left.representativeItem!.dateAdded > right.representativeItem!.dateAdded
        })
            .prefix(count)
            .map { AlbumModel(albumId: AlbumId(id: $0.representativeItem!.albumPersistentID), primaryText: $0.representativeItem?.albumTitle, secondaryText: $0.representativeItem?.artist, artwork: $0.representativeItem?.artwork) }
    }
}
