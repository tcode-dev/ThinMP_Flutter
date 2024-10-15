//
//  MusicPlayerContract.swift
//  ThinMP
//
//  Created by tk on 2021/07/25.
//

protocol MusicPlayerContract {
    func start(list: [SongModelContract], currentIndex: Int)

    func play()

    func pause()

    func prev()

    func next()

    func seek(time: TimeInterval)
    
    func getCurrentSong() -> SongModelContract?
    
    func getDuration() -> Double
    
    func getCurrentTime() -> Double

    func setRepeat(repeatMode: RepeatMode)

    func setShuffle(shuffleMode: ShuffleMode)
}
