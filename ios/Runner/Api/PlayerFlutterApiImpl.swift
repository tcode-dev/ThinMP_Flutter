//
//  PlayerFlutterApiImpl.swift
//  Runner
//
//  Created by tk on 2024/07/28.
//

import Foundation

class PlayerFlutterApiImpl {
    static private var api: PlayerFlutterApi?

    static func setup(binaryMessenger: FlutterBinaryMessenger) {
        api = PlayerFlutterApi(binaryMessenger: binaryMessenger)
    }

    func onIsPlayingChange(isPlaying: Bool) {
        PlayerFlutterApiImpl?.api.onIsPlayingChange(isPlaying: isPlaying) { }
    }

    func onPlaybackSongChange(song: SongModel) {
        var song2 = Song2(id: song.id, title: song.primaryText, artist: song.secondaryText, imageId: song.id)

        PlayerFlutterApiImpl?.api.onPlaybackSongChange(songArg: song2) { }
    }
}
