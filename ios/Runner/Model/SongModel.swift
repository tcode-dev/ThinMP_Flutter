//
//  SongModel.swift
//  ThinMP
//
//  Created by tk on 2021/05/04.
//

import MediaPlayer

struct SongModel: SongModelContract {
    let media: MPMediaItemCollection

    var id: SongId {
        SongId(id: media.representativeItem?.persistentID ?? 0)
    }

    var name: String {
        media.representativeItem?.title ?? "undefined"
    }

    var albumId: AlbumId {
        AlbumId(id: media.representativeItem?.albumPersistentID ?? 0)
    }

    var albumName: String {
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
        String(id.raw)
    }

    var artwork: MPMediaItemArtwork? {
        media.representativeItem?.artwork
    }

    var duration: Double {
        media.representativeItem?.playbackDuration ?? 0
    }

    var trackNumber: Int {
        media.representativeItem?.albumTrackNumber ?? 0
    }
}
