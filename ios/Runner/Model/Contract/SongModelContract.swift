//
//  SongModelContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

import MediaPlayer

protocol SongModelContract {
    var media: MPMediaItemCollection { get }

    var id: String { get }

    var songId: SongId { get }

    var imageId: String { get }

    var title: String { get }

    var artist: String { get }

    var artwork: MPMediaItemArtwork? { get }

    var duration: Double { get }
}
