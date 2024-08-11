//
//  SongRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

import Foundation

protocol SongRepositoryContract {
    func findAll() -> [SongModel]
    
    func findById(id: String) -> SongModel?
    
    func findByArtistId(artistId: ArtistId) -> [SongModel]
    
    func findByAlbumId(albumId: AlbumId) -> [SongModel]
}
