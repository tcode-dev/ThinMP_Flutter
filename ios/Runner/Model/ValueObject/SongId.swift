//
//  SongId.swift
//  ThinMP
//
//  Created by tk on 2021/06/21.
//

class SongId: Id {
    func equals(_ songId: SongId) -> Bool {
        return songId.id == id
    }
}
