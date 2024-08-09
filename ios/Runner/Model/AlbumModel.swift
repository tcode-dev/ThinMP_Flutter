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
        id
    }

    var title: String {
        media.representativeItem?.albumTitle ?? "undefined"
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
