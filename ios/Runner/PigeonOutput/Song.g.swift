// Autogenerated from Pigeon (v16.0.4), do not edit directly.
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

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct Song {
  var title: String
  var artist: String

  static func fromList(_ list: [Any?]) -> Song? {
    let title = list[0] as! String
    let artist = list[1] as! String

    return Song(
      title: title,
      artist: artist
    )
  }
  func toList() -> [Any?] {
    return [
      title,
      artist,
    ]
  }
}
private class HostSongApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return Song.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class HostSongApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Song {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class HostSongApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return HostSongApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return HostSongApiCodecWriter(data: data)
  }
}

class HostSongApiCodec: FlutterStandardMessageCodec {
  static let shared = HostSongApiCodec(readerWriter: HostSongApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol HostSongApi {
  func findAll() throws -> [Song]
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class HostSongApiSetup {
  /// The codec used by HostSongApi.
  static var codec: FlutterStandardMessageCodec { HostSongApiCodec.shared }
  /// Sets up an instance of `HostSongApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: HostSongApi?) {
    let findAllChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.HostSongApi.findAll", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      findAllChannel.setMessageHandler { _, reply in
        do {
          let result = try api.findAll()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      findAllChannel.setMessageHandler(nil)
    }
  }
}
