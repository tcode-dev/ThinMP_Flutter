//
//  PlayerFlutterApiImpl.swift
//  Runner
//
//  Created by tk on 2024/07/28.
//

class PlayerFlutterApiImpl {
    static var api: PlayerFlutterApi!

    static func setUp(binaryMessenger: FlutterBinaryMessenger) {
        api = PlayerFlutterApi(binaryMessenger: binaryMessenger)
    }

    func onIsPlayingChange(isPlaying: Bool, completion: @escaping (Result<Void, PigeonError>) -> Void = { _ in }) {
        PlayerFlutterApiImpl.api.onIsPlayingChange(isPlaying: isPlaying, completion: completion)
    }

    func onPlaybackSongChange(song: SongModel, completion: @escaping (Result<Void, PigeonError>) -> Void = { _ in }) {
        let playbackSong = Song(id: song.id, title: song.title, artist: song.artist, imageId: song.imageId, duration: song.duration)

        PlayerFlutterApiImpl.api.onPlaybackSongChange(song: playbackSong, completion: completion)
    }
}
