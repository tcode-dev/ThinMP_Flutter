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
struct CurrentSong {
  var id: String
  var title: String
  var artist: String
  var imageId: String

  static func fromList(_ list: [Any?]) -> CurrentSong? {
    let id = list[0] as! String
    let title = list[1] as! String
    let artist = list[2] as! String
    let imageId = list[3] as! String

    return CurrentSong(
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

/// Generated class from Pigeon that represents data sent in messages.
struct PlaybackState {
  var isPlaying: Bool
  var song: CurrentSong? = nil

  static func fromList(_ list: [Any?]) -> PlaybackState? {
    let isPlaying = list[0] as! Bool
    var song: CurrentSong? = nil
    if let songList: [Any?] = nilOrValue(list[1]) {
      song = CurrentSong.fromList(songList)
    }

    return PlaybackState(
      isPlaying: isPlaying,
      song: song
    )
  }
  func toList() -> [Any?] {
    return [
      isPlaying,
      song?.toList(),
    ]
  }
}
private class PlayerHostApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return CurrentSong.fromList(self.readValue() as! [Any?])
    case 129:
      return PlaybackState.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class PlayerHostApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? CurrentSong {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? PlaybackState {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class PlayerHostApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return PlayerHostApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return PlayerHostApiCodecWriter(data: data)
  }
}

class PlayerHostApiCodec: FlutterStandardMessageCodec {
  static let shared = PlayerHostApiCodec(readerWriter: PlayerHostApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol PlayerHostApi {
  func startBySongs(index: Int64) throws
  func play() throws
  func pause() throws
  func prev() throws
  func next() throws
  func getPlaybackState() throws -> PlaybackState
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class PlayerHostApiSetup {
  /// The codec used by PlayerHostApi.
  static var codec: FlutterStandardMessageCodec { PlayerHostApiCodec.shared }
  /// Sets up an instance of `PlayerHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: PlayerHostApi?) {
    let startBySongsChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.startBySongs", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      startBySongsChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let indexArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        do {
          try api.startBySongs(index: indexArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startBySongsChannel.setMessageHandler(nil)
    }
    let playChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.play", binaryMessenger: binaryMessenger, codec: codec)
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
    let pauseChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.pause", binaryMessenger: binaryMessenger, codec: codec)
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
    let prevChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.prev", binaryMessenger: binaryMessenger, codec: codec)
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
    let nextChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.next", binaryMessenger: binaryMessenger, codec: codec)
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
    let getPlaybackStateChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.getPlaybackState", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getPlaybackStateChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getPlaybackState()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getPlaybackStateChannel.setMessageHandler(nil)
    }
  }
}
private class PlayerFlutterApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return CurrentSong.fromList(self.readValue() as! [Any?])
    case 129:
      return PlaybackState.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class PlayerFlutterApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? CurrentSong {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? PlaybackState {
      super.writeByte(129)
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

/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol PlayerFlutterApiProtocol {
  func onPlaybackStateChange(playbackState playbackStateArg: PlaybackState, completion: @escaping (Result<Void, FlutterError>) -> Void)
}
class PlayerFlutterApi: PlayerFlutterApiProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger) {
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return PlayerFlutterApiCodec.shared
  }
  func onPlaybackStateChange(playbackState playbackStateArg: PlaybackState, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onPlaybackStateChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([playbackStateArg] as [Any?]) { response in
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
