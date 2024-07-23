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

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol PlayerHostApi {
  func startBySongs(index: Int64) throws
  func play() throws
  func stop() throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class PlayerHostApiSetup {
  /// The codec used by PlayerHostApi.
  /// Sets up an instance of `PlayerHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: PlayerHostApi?) {
    let startBySongsChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.startBySongs", binaryMessenger: binaryMessenger)
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
    let stopChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.thinmpf.PlayerHostApi.stop", binaryMessenger: binaryMessenger)
    if let api = api {
      stopChannel.setMessageHandler { _, reply in
        do {
          try api.stop()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      stopChannel.setMessageHandler(nil)
    }
  }
}
