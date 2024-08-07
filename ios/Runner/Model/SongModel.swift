//
//  SongModel.swift
//  ThinMP
//
//  Created by tk on 2021/05/04.
//

import MediaPlayer

struct SongModel {
    let media: MPMediaItemCollection

    var id: String {
        return String(songId.id)
    }

    var songId: SongId {
        SongId(id: media.representativeItem?.persistentID ?? 0)
    }

    var imageId: String {
        id
    }

    var title: String {
        media.representativeItem?.title ?? "undefined"
    }

    var artist: String {
        media.representativeItem?.artist ?? "undefined"
    }

    var artwork: MPMediaItemArtwork? {
        media.representativeItem?.artwork
    }

    var duration: Double {
        media.representativeItem?.playbackDuration ?? 0
    }
}
