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

    var isActive: Bool = false
    var isPlaying: Bool = false
    var song: SongModel?
    var currentSecond: Double = 0
    var durationSecond: Double = 1
    var isRepeatOff: Bool = true
    var isRepeatOne: Bool = false
    var isRepeatAll: Bool = false
    var shuffleMode: Bool = false
    var isFavoriteArtist: Bool = false
    var isFavoriteSong: Bool = false

//    private let playerConfig: PlayerConfig
    private let player: MPMusicPlayerController
    private var timer: Timer?
    private var isBackground = false
    private var isFirst = false

    init() {
//        playerConfig = PlayerConfig()
        player = MPMusicPlayerController.applicationMusicPlayer
//        player.repeatMode = playerConfig.getRepeat()
//        player.shuffleMode = playerConfig.getShuffle()
        setRepeat()
        setShuffle()
        player.beginGeneratingPlaybackNotifications()
    }

    func getCurrentSong() -> SongModel? {
        return song
    }

    func start(list: [SongModel], currentIndex: Int) {
        stop()
        song = list[currentIndex]

        let items = MPMediaItemCollection(items: list.map { $0.media.representativeItem! as MPMediaItem })
        let descriptor = MPMusicPlayerMediaItemQueueDescriptor(itemCollection: items)

        descriptor.startItem = song?.media.representativeItem
        player.setQueue(with: descriptor)
        doPlay()
        addObserver()
        isFirst = true
        isActive = true
    }

    func play() {
        doPlay()
        startProgress()
    }

    func pause() {
        doPause()
        stopProgress()
    }

    func prev() {
        if isPlaying {
            playPrev()
        } else {
            doPrev()
        }
    }

    func next() {
        if isPlaying {
            playNext()
        } else {
            doNext()
        }
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

    func setBackground(background: Bool) {
        isBackground = background
    }

    func changeRepeat() {
        player.repeatMode = player.repeatMode == .none ? .all
            : player.repeatMode == .all ? .one
            : .none
        setRepeat()
//        playerConfig.setRepeat(value: player.repeatMode)
    }

    func shuffle() {
        player.shuffleMode = player.shuffleMode == .off ? .songs : .off
        setShuffle()
//        playerConfig.setShuffle(value: player.shuffleMode)
    }

    func songId() -> SongId {
        return SongId(id: player.nowPlayingItem!.persistentID)
    }

    private func setSong() {
        if player.nowPlayingItem != nil {
            song = SongModel(media: MPMediaItemCollection(items: [player.nowPlayingItem! as MPMediaItem]))
            player.skipToBeginning()
            resetTime()
            isActive = true
        } else {
            currentSecond = 0
            durationSecond = 1
            isActive = false
        }
    }

    private func doPlay() {
        isPlaying = true

        player.prepareToPlay()
        player.play()
    }

    private func doPause() {
        isPlaying = false
        player.pause()
    }

    private func stop() {
        if !isPlaying {
            return
        }

        isPlaying = false
        player.stop()
    }

    private func doPrev() {
        stop()

        if currentSecond <= PREV_SECOND {
            player.skipToPreviousItem()
            setSong()
        } else {
            player.skipToBeginning()
            resetTime()
        }
    }

    private func playPrev() {
        doPrev()
        doPlay()
    }

    private func doNext() {
        stop()
        player.skipToNextItem()
        setSong()
        resetTime()
    }

    private func playNext() {
        doNext()
        doPlay()
    }

    private func addObserver() {
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange,
            object: player,
            queue: OperationQueue.main
        ) { _ in
            self.MPMusicPlayerControllerNowPlayingItemDidChangeCallback()
        }

        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange,
            object: player,
            queue: OperationQueue.main
        ) { _ in
            self.MPMusicPlayerControllerPlaybackStateDidChangeCallback()
        }
    }

    private func MPMusicPlayerControllerPlaybackStateDidChangeCallback() {
        let api = PlayerFlutterApiImpl()

        if isPlaying, !isBackground {
            return
        }

        switch player.playbackState {
        case MPMusicPlaybackState.stopped:

            break
        case MPMusicPlaybackState.playing:
            isPlaying = true
            api.onIsPlayingChange(isPlaying: isPlaying)

            break
        case MPMusicPlaybackState.paused:
            isPlaying = false
            api.onIsPlayingChange(isPlaying: isPlaying)

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

    private func MPMusicPlayerControllerNowPlayingItemDidChangeCallback() {
        setSong()

        if player.repeatMode == .none, player.indexOfNowPlayingItem == 0, !isFirst {
            isPlaying = false
        }

        isFirst = false

        let api = PlayerFlutterApiImpl()
        api.onPlaybackSongChange(song: song!)
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
}
