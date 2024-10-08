//
//  SongRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

protocol SongRepositoryContract {
    func findAll() -> [SongModel]
    
    func findBySongId(songId: SongId) -> SongModel?
    
    func findBySongIds(songIds: [SongId]) -> [SongModel]
    
    func findByAlbumId(albumId: AlbumId) -> [SongModel]
    
    func findByAlbumIds(albumIds: [AlbumId]) -> [SongModel]
}
