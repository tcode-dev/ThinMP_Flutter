//
//  SongRepository.swift
//  ThinMP
//
//  Created by tk on 2021/05/05.
//

import MediaPlayer

class SongRepository: SongRepositoryContract {
    func findAll() -> [SongModel] {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.songs()

        query.addFilterPredicate(property)

        return query.collections!.map { SongModel(media: $0) }
    }

    func findBySongId(songId: SongId) -> SongModel? {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.songs()

        query.addFilterPredicate(property)

        let song = query.collections?.first { songId.raw == $0.representativeItem?.persistentID }

        if (song == nil) {
            return nil
        }

        return SongModel(media: song!)
    }

    func findBySongIds(songIds: [SongId]) -> [SongModel] {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.songs()
        let ids = songIds.map { $0.raw }

        query.addFilterPredicate(property)

        let filtered = query.collections!.filter { ids.contains($0.representativeItem?.persistentID ?? 0) }

        return songIds
            .filter { songId in filtered.contains(where: { $0.representativeItem?.persistentID == songId.raw }) }
            .map { songId in filtered.first { $0.representativeItem?.persistentID == songId.raw }! }
            .map { SongModel(media: $0) }
    }

    func findByArtistId(artistId: ArtistId) -> [SongModel] {
        let property = MPMediaPropertyPredicate(value: artistId.raw, forProperty: MPMediaItemPropertyArtistPersistentID)
        let query = MPMediaQuery.songs()

        query.addFilterPredicate(property)

        return query.collections!.sorted(by: { String($0.representativeItem?.albumTitle ?? "") < String($1.representativeItem?.albumTitle ?? "") })
            .map { SongModel(media: $0) }
    }

    func findByAlbumId(albumId: AlbumId) -> [SongModel] {
        let property = MPMediaPropertyPredicate(value: albumId.raw, forProperty: MPMediaItemPropertyAlbumPersistentID)
        let query = MPMediaQuery.songs()

        query.addFilterPredicate(property)

        return query.collections!.map { SongModel(media: $0) }
    }
}
