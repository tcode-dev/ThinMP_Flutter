//
//  MusicPlayer.swift
//  ThinMP
//
//  Created by tk on 2020/01/31.
//

import MediaPlayer

class MusicPlayer: MediaPlayerProtocol {
    static let shared = MusicPlayer()
    private let PREV_SECOND: Double = 3

    var currentSecond: Double = 0
    var durationSecond: Double = 1
    var isRepeatOff: Bool = true
    var isRepeatOne: Bool = false
    var isRepeatAll: Bool = false
    var shuffleMode: Bool = false
    var isFavoriteArtist: Bool = false
    var isFavoriteSong: Bool = false

//    private let playerConfig: PlayerConfig
    private let flutterApi: PlayerFlutterApiImpl
    private let player: MPMusicPlayerController
    private var timer: Timer?
    private var isBackground = false
    private var nowPlayingItemDidChangeDebounceTimer: Timer?
    private var playbackStateDidChangeDebounceTimer: Timer?
    private let debounceTimeInterval = 0.1

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
        if currentSecond <= PREV_SECOND {
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

    func immediateUpdateTime() {
        Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: { _ in
            self.updateTime()
        })
    }

    func startProgress() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateTime()
        })
    }

    func stopProgress() {
        timer?.invalidate()
    }

    func changeRepeat() {
//        player.repeatMode = player.repeatMode == .none ? .all
//            : player.repeatMode == .all ? .one
//            : .none
//        setRepeat()
//        playerConfig.setRepeat(value: player.repeatMode)
    }

    func shuffle() {
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
            self.nowPlayingItemDidChangeDebounce {
                self.nowPlayingItemDidChangeCallback()
            }
        }

        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange,
            object: player,
            queue: OperationQueue.main
        ) { _ in
            self.playbackStateDidChangeDebounce {
                self.playbackStateDidChangeCallback()
            }
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
        flutterApi.onPlaybackSongChange(song: getCurrentSong()!)
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

    private func resetTime() {
        let second = player.nowPlayingItem?.playbackDuration ?? 0
        durationSecond = second > 0 ? second : 1
        updateTime()
    }

    private func updateTime() {
        currentSecond = Double(player.currentPlaybackTime)
    }

    private func setRepeat() {
        isRepeatOff = player.repeatMode == .none
        isRepeatOne = player.repeatMode == .one
        isRepeatAll = player.repeatMode == .all
    }

    private func setShuffle() {
        shuffleMode = player.shuffleMode == .songs
    }
    
    // ios17以降MPMusicPlayerControllerNowPlayingItemDidChangeが複数回呼ばれる
    // debounceを使用して一定時間内に複数回発生した通知を1回にまとめる
    private func nowPlayingItemDidChangeDebounce(action: @escaping () -> Void) {
        nowPlayingItemDidChangeDebounceTimer?.invalidate()
        nowPlayingItemDidChangeDebounceTimer = Timer.scheduledTimer(withTimeInterval: debounceTimeInterval, repeats: false) { _ in
            action()
        }
    }

    private func playbackStateDidChangeDebounce(action: @escaping () -> Void) {
        playbackStateDidChangeDebounceTimer?.invalidate()
        playbackStateDidChangeDebounceTimer = Timer.scheduledTimer(withTimeInterval: debounceTimeInterval, repeats: false) { _ in
            action()
        }
    }

    deinit {
        removeObserver()

        player.endGeneratingPlaybackNotifications()
     }
}
