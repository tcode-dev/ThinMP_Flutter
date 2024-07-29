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
//        api = PlayerFlutterApi(binaryMessenger: binaryMessenger)
    }

    func onIsPlayingChange(isPlaying: Bool) {
//        api.onIsPlayingChange(isPlaying: isPlaying) { }
    }

    func onPlaybackSongChange(song: SongModel) {
//        let playbackSong = Song2(id: song.id, name: song.name, artistName: song.artistName, albumId: song.albumId)
//
//        api.onPlaybackSongChange(song: playbackSong) { }
    }
}
