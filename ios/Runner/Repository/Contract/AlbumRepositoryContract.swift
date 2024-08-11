//
//  AlbumRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

import Foundation

protocol AlbumRepositoryContract {
    func findAll() -> [AlbumModel]

    func findById(albumId: UInt64) -> AlbumModel?
    
    func findByArtistId(artistId: ArtistId) -> [AlbumModel]
}
