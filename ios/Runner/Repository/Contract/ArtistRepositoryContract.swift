//
//  ArtistRepositoryContract.swift
//  Runner
//
//  Created by t k on 2024/08/12.
//

import Foundation

protocol ArtistRepositoryContract {
    func findAll() -> [ArtistModel]
}
