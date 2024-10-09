//
//  ArtistRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

protocol ArtistRepositoryContract {
    func findAll() -> [ArtistModel]

    func findById(artistId: ArtistId) -> ArtistModel?
    
    func findByIds(artistIds: [ArtistId]) -> [ArtistModel]
}
