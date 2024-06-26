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
        SongId(id: media.persistentID)
    }

    var primaryText: String {
        media.representativeItem?.title ?? "undefined"
    }

    var secondaryText: String {
        media.representativeItem?.artist ?? "undefined"
    }

    var artwork: MPMediaItemArtwork? {
        media.representativeItem?.artwork
    }
}
