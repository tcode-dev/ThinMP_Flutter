//
//  AlbumModel.swift
//  Runner
//
//  Created by t k on 2024/08/09.
//

import MediaPlayer

struct AlbumModel {
    let media: MPMediaItemCollection

    var id: String {
        return String(albumId.id)
    }

    var albumId: AlbumId {
        AlbumId(id: media.representativeItem?.albumPersistentID ?? 0)
    }

    var imageId: String {
        if let firstItem = media.items.first {
            return String(firstItem.persistentID)
        } else {
            return "0"
        }
    }

    var title: String {
        if let albumTitle = media.representativeItem?.albumTitle, !albumTitle.isEmpty {
            return albumTitle
        } else if let title = media.representativeItem?.title, !title.isEmpty {
            return title
        } else {
            return "undefined"
        }
    }

    var artist: String {
        media.representativeItem?.artist ?? "undefined"
    }

    var artwork: MPMediaItemArtwork? {
        media.representativeItem?.artwork
    }

    
//    var albumId: AlbumId
//    var imageId: String {
//        id
//    }
//    var title: String?
//    var artist: String?
//    var artwork: MPMediaItemArtwork?
//    var id: String {
//        return String(albumId.id)
//    }
}
