//
//  ArtistModel.swift
//  Runner
//
//  Created by t k on 2024/08/10.
//

import MediaPlayer

struct ArtistModel: ArtistModelContract {
    let media: MPMediaItemCollection

    var id: String {
        return String(artistId.id)
    }

    var artistId: ArtistId {
        ArtistId(id: media.representativeItem?.artistPersistentID ?? 0)
    }

    var artist: String {
        media.representativeItem?.artist ?? "undefined"
    }
}
