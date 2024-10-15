//
//  ArtistRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

protocol ArtistRepositoryContract {
    func findAll() -> [ArtistModelContract]

    func findById(artistId: ArtistId) -> ArtistModelContract?
    
    func findByIds(artistIds: [ArtistId]) -> [ArtistModelContract]
}
