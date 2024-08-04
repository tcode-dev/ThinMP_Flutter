// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

extension FlutterError: Error {}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> FlutterError {
  return FlutterError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct Song {
  var id: String
  var title: String
  var artist: String
  var imageId: String

  static func fromList(_ list: [Any?]) -> Song? {
    let id = list[0] as! String
    let title = list[1] as! String
    let artist = list[2] as! String
    let imageId = list[3] as! String

    return Song(
      id: id,
      title: title,
      artist: artist,
      imageId: imageId
    )
  }
  func toList() -> [Any?] {
    return [
      id,
      title,
      artist,
      imageId,
    ]
  }
}

/// HostApi
///
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol ArtworkHostApi {
  func queryArtwork(id: String, completion: @escaping (Result<FlutterStandardTypedData?, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class ArtworkHostApiSetup {
  /// The codec used by ArtworkHostApi.
  /// Sets up an instance of `ArtworkHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: ArtworkHostApi?) {
    let queryArtworkChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.ArtworkHostApi.queryArtwork", binaryMessenger: binaryMessenger)
    if let api = api {
      queryArtworkChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let idArg = args[0] as! String
        api.queryArtwork(id: idArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      queryArtworkChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol PlayerHostApi {
  func startAllSongs(index: Int64) throws
  func play() throws
  func pause() throws
  func prev() throws
  func next() throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class PlayerHostApiSetup {
  /// The codec used by PlayerHostApi.
  /// Sets up an instance of `PlayerHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: PlayerHostApi?) {
    let startAllSongsChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.startAllSongs", binaryMessenger: binaryMessenger)
    if let api = api {
      startAllSongsChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let indexArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        do {
          try api.startAllSongs(index: indexArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startAllSongsChannel.setMessageHandler(nil)
    }
    let playChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.play", binaryMessenger: binaryMessenger)
    if let api = api {
      playChannel.setMessageHandler { _, reply in
        do {
          try api.play()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      playChannel.setMessageHandler(nil)
    }
    let pauseChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.pause", binaryMessenger: binaryMessenger)
    if let api = api {
      pauseChannel.setMessageHandler { _, reply in
        do {
          try api.pause()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      pauseChannel.setMessageHandler(nil)
    }
    let prevChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.prev", binaryMessenger: binaryMessenger)
    if let api = api {
      prevChannel.setMessageHandler { _, reply in
        do {
          try api.prev()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      prevChannel.setMessageHandler(nil)
    }
    let nextChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.next", binaryMessenger: binaryMessenger)
    if let api = api {
      nextChannel.setMessageHandler { _, reply in
        do {
          try api.next()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      nextChannel.setMessageHandler(nil)
    }
  }
}
private class SongHostApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return Song.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class SongHostApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Song {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class SongHostApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return SongHostApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return SongHostApiCodecWriter(data: data)
  }
}

class SongHostApiCodec: FlutterStandardMessageCodec {
  static let shared = SongHostApiCodec(readerWriter: SongHostApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol SongHostApi {
  func getAllSongs() throws -> [Song]
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class SongHostApiSetup {
  /// The codec used by SongHostApi.
  static var codec: FlutterStandardMessageCodec { SongHostApiCodec.shared }
  /// Sets up an instance of `SongHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: SongHostApi?) {
    let getAllSongsChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.SongHostApi.getAllSongs", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getAllSongsChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getAllSongs()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getAllSongsChannel.setMessageHandler(nil)
    }
  }
}
private class PlayerFlutterApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return Song.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class PlayerFlutterApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Song {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class PlayerFlutterApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return PlayerFlutterApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return PlayerFlutterApiCodecWriter(data: data)
  }
}

class PlayerFlutterApiCodec: FlutterStandardMessageCodec {
  static let shared = PlayerFlutterApiCodec(readerWriter: PlayerFlutterApiCodecReaderWriter())
}

/// FlutterApi
///
/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol PlayerFlutterApiProtocol {
  func onIsPlayingChange(isPlaying isPlayingArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onPlaybackSongChange(song songArg: Song, completion: @escaping (Result<Void, FlutterError>) -> Void)
}
class PlayerFlutterApi: PlayerFlutterApiProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger) {
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return PlayerFlutterApiCodec.shared
  }
  func onIsPlayingChange(isPlaying isPlayingArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onIsPlayingChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([isPlayingArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onPlaybackSongChange(song songArg: Song, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onPlaybackSongChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([songArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}
