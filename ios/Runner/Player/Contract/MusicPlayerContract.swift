//
//  MusicPlayerContract.swift
//  ThinMP
//
//  Created by tk on 2021/07/25.
//

protocol MusicPlayerContract {
    func start(list: [SongModel], currentIndex: Int)

    func play()

    func pause()

    func prev()

    func next()

    func seek(time: TimeInterval)

    func setRepeat()

    func setShuffle()
}
