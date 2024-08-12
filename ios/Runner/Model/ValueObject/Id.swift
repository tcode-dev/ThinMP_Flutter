//
//  Id.swift
//  Runner
//
//  Created by t k on 2024/08/10.
//

import MediaPlayer

class Id {
    var id: MPMediaEntityPersistentID

    init(id: Any) {
        if let id = id as? MPMediaEntityPersistentID {
            self.id = id
        } else if let idString = id as? String, let id = UInt64(idString) {
            self.id = id
        } else {
            fatalError("Invalid id type")
        }
    }
}
