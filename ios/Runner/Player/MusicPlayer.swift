//
//  MusicPlayer.swift
//  ThinMP
//
//  Created by tk on 2020/01/31.
//

import MediaPlayer

class MusicPlayer: MusicPlayerContract {
    static let shared = MusicPlayer()
    private let PREV_SECOND: Double = 3

    var isRepeatOff: Bool = true
    var isRepeatOne: Bool = false
    var isRepeatAll: Bool = false
    var shuffleMode: Bool = false
    var isFavoriteArtist: Bool = false
    var isFavoriteSong: Bool = false

//    private let playerConfig: PlayerConfig
    private let flutterApi: PlayerFlutterApiImpl
    private let player: MPMusicPlayerController
    private var isBackground = false

    init() {
//        playerConfig = PlayerConfig()
        flutterApi = PlayerFlutterApiImpl()
        player = MPMusicPlayerController.applicationMusicPlayer
//        player.repeatMode = playerConfig.getRepeat()
//        player.shuffleMode = playerConfig.getShuffle()
//        setRepeat()
//        setShuffle()
        addObserver()
        player.beginGeneratingPlaybackNotifications()
    }

    func getCurrentSong() -> SongModel? {
        if (player.nowPlayingItem == nil) {
            return nil
        }
        return SongModel(media: MPMediaItemCollection(items: [player.nowPlayingItem! as MPMediaItem]))
    }

    func start(list: [SongModel], currentIndex: Int) {
        if (player.playbackState == MPMusicPlaybackState.playing) {
            player.stop()
        }

        let items = MPMediaItemCollection(items: list.map { $0.media.representativeItem! as MPMediaItem })
        let descriptor = MPMusicPlayerMediaItemQueueDescriptor(itemCollection: items)

        descriptor.startItem = list[currentIndex].media.representativeItem
        player.setQueue(with: descriptor)
        play()
    }

    func play() {
        player.play()
    }

    func pause() {
        player.pause()
    }

    func prev() {
        if player.currentPlaybackTime <= PREV_SECOND {
            player.skipToPreviousItem()
        } else {
            player.skipToBeginning()
        }
    }

    func next() {
        player.skipToNextItem()
    }

    func seek(time: TimeInterval) {
        player.currentPlaybackTime = time
    }

//    func immediateUpdateTime() {
//        Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: { _ in
//            self.updateTime()
//        })
//    }

//    func startProgress() {
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
//            self.updateTime()
//        })
//    }

//    func stopProgress() {
//        timer?.invalidate()
//    }

    func getDuration() -> Double {
        return player.nowPlayingItem?.playbackDuration ?? 0
    }

    func getCurrentTime() -> Double {
        return Double(player.currentPlaybackTime)
    }

    func setRepeat() {
//        player.repeatMode = player.repeatMode == .none ? .all
//            : player.repeatMode == .all ? .one
//            : .none
//        setRepeat()
//        playerConfig.setRepeat(value: player.repeatMode)
    }

    func setShuffle() {
//        player.shuffleMode = player.shuffleMode == .off ? .songs : .off
//        setShuffle()
//        playerConfig.setShuffle(value: player.shuffleMode)
    }

    private func addObserver() {
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange,
            object: player,
            queue: OperationQueue.main
        ) { _ in
            self.nowPlayingItemDidChangeCallback()
        }

        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange,
            object: player,
            queue: OperationQueue.main
        ) { _ in
            self.playbackStateDidChangeCallback()
        }
    }

    private func removeObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange,
            object: player
        )

        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange,
            object: player
        )
    }

    private func nowPlayingItemDidChangeCallback() {
        if let song = getCurrentSong() {
            flutterApi.onPlaybackSongChange(song: song)
        }
    }

    private func playbackStateDidChangeCallback() {
        switch player.playbackState {
        case MPMusicPlaybackState.stopped:

            break
        case MPMusicPlaybackState.playing:
            flutterApi.onIsPlayingChange(isPlaying: true)

            break
        case MPMusicPlaybackState.paused:
            flutterApi.onIsPlayingChange(isPlaying: false)

            break
        case MPMusicPlaybackState.interrupted:

            break
        case MPMusicPlaybackState.seekingForward:

            break
        case MPMusicPlaybackState.seekingBackward:

            break
        default:

            break
        }
    }

    deinit {
        removeObserver()

        player.endGeneratingPlaybackNotifications()
     }
}
