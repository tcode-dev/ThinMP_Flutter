//
//  AlbumModelContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

import MediaPlayer

protocol AlbumModelContract {
    var media: MPMediaItemCollection { get }

    var id: AlbumId { get }

    var name: String { get }

    var artistId: ArtistId { get }

    var artistName: String { get }

    var imageId: String { get }

    var artwork: MPMediaItemArtwork? { get }
}
