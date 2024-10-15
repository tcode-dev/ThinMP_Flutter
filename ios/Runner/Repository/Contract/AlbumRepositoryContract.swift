//
//  AlbumRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

protocol AlbumRepositoryContract {
    func findAll() -> [AlbumModelContract]

    func findByAlbumId(albumId: AlbumId) -> AlbumModelContract?

    func findByArtistId(artistId: ArtistId) -> [AlbumModelContract]

    func findFirstByArtistId(artistId: ArtistId) -> AlbumModelContract?

    func findRecentAlbums(count: Int) -> [AlbumModelContract]
}
