//
//  AlbumRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

protocol AlbumRepositoryContract {
    func findAll() -> [AlbumModel]

    func findByAlbumId(albumId: AlbumId) -> AlbumModel?
    
    func findByArtistId(artistId: ArtistId) -> [AlbumModel]
}
