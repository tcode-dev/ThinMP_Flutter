//
//  AlbumModel.swift
//  Runner
//
//  Created by t k on 2024/08/09.
//

import MediaPlayer

struct AlbumModel: AlbumModelContract {
    let media: MPMediaItemCollection

    var id: AlbumId {
        AlbumId(id: media.representativeItem?.albumPersistentID ?? 0)
    }

    var name: String {
        if let albumTitle = media.representativeItem?.albumTitle, !albumTitle.isEmpty {
            return albumTitle
        } else if let title = media.representativeItem?.title, !title.isEmpty {
            return title
        } else {
            return "undefined"
        }
    }

    var artistId: ArtistId {
        ArtistId(id: media.representativeItem?.artistPersistentID ?? 0)
    }

    var artistName: String {
        media.representativeItem?.artist ?? "undefined"
    }

    var imageId: String {
        if let firstItem = media.items.first {
            return String(firstItem.persistentID)
        } else {
            return "0"
        }
    }

    var artwork: MPMediaItemArtwork? {
        media.representativeItem?.artwork
    }
}
