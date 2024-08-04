//
//  PlayerFlutterApiImpl.swift
//  Runner
//
//  Created by tk on 2024/07/28.
//

import Foundation

class PlayerFlutterApiImpl {
    static var api: PlayerFlutterApi!

    static func setup(binaryMessenger: FlutterBinaryMessenger) {
        api = PlayerFlutterApi(binaryMessenger: binaryMessenger)
    }

    func onIsPlayingChange(isPlaying: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void = { _ in }) {
        PlayerFlutterApiImpl.api.onIsPlayingChange(isPlaying: isPlaying, completion: completion)
    }

    func onPlaybackSongChange(song: SongModel, completion: @escaping (Result<Void, FlutterError>) -> Void = { _ in }) {
        let playbackSong = Song(id: song.id, title: song.primaryText, artist: song.secondaryText, imageId: song.id)

        PlayerFlutterApiImpl.api.onPlaybackSongChange(song: playbackSong, completion: completion)
    }
}
