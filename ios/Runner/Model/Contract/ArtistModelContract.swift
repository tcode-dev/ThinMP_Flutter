//
//  ArtistModelContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

import MediaPlayer

protocol ArtistModelContract {
    var media: MPMediaItemCollection { get }

    var id: String { get }

    var artistId: ArtistId { get }

    var artist: String { get }
}
