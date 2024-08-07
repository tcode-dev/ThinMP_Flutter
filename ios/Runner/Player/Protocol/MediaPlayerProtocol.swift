//
//  MediaPlayerProtocol.swift
//  ThinMP
//
//  Created by tk on 2021/07/25.
//

import Foundation

protocol MediaPlayerProtocol {
    func start(list: [SongModel], currentIndex: Int)

    func play()

    func pause()

    func prev()

    func next()

    func seek(time: TimeInterval)

    func changeRepeat()

    func shuffle()
}
