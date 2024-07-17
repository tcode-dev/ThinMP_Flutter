//
//  HostArtworkApiImpl.swift
//  Runner
//
//  Created by tk on 2024/07/01.
//

import Foundation

class HostArtworkApiImpl: HostArtworkApi {
    func queryArtwork(id: String, completion: @escaping (Result<FlutterStandardTypedData?, Error>) -> Void) {
        let repository = SongRepository()
        let song = repository.findById(id: id)
        let image = song?.artwork?.image(at: CGSize(width: 100, height: 100))
        let data = image?.pngData() as Data?

        if data == nil {
            completion(.success(nil))
            return
        }

        completion(.success(FlutterStandardTypedData(bytes: data!)))
    }
}
