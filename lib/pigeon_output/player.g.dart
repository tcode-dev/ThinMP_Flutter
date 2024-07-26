// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

class CurrentSong {
  CurrentSong({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageId,
  });

  String id;

  String title;

  String artist;

  String imageId;

  Object encode() {
    return <Object?>[
      id,
      title,
      artist,
      imageId,
    ];
  }

  static CurrentSong decode(Object result) {
    result as List<Object?>;
    return CurrentSong(
      id: result[0]! as String,
      title: result[1]! as String,
      artist: result[2]! as String,
      imageId: result[3]! as String,
    );
  }
}

class PlaybackState {
  PlaybackState({
    required this.isPlaying,
    this.song,
  });

  bool isPlaying;

  CurrentSong? song;

  Object encode() {
    return <Object?>[
      isPlaying,
      song?.encode(),
    ];
  }

  static PlaybackState decode(Object result) {
    result as List<Object?>;
    return PlaybackState(
      isPlaying: result[0]! as bool,
      song: result[1] != null
          ? CurrentSong.decode(result[1]! as List<Object?>)
          : null,
    );
  }
}

class _PlayerHostApiCodec extends StandardMessageCodec {
  const _PlayerHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is CurrentSong) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PlaybackState) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return CurrentSong.decode(readValue(buffer)!);
      case 129: 
        return PlaybackState.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class PlayerHostApi {
  /// Constructor for [PlayerHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PlayerHostApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PlayerHostApiCodec();

  Future<void> startBySongs(int index) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.thinmpf.PlayerHostApi.startBySongs';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[index]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> play() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.thinmpf.PlayerHostApi.play';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> stop() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.thinmpf.PlayerHostApi.stop';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<PlaybackState> getPlaybackState() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.thinmpf.PlayerHostApi.getPlaybackState';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as PlaybackState?)!;
    }
  }
}

class _PlayerFlutterApiCodec extends StandardMessageCodec {
  const _PlayerFlutterApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is CurrentSong) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PlaybackState) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return CurrentSong.decode(readValue(buffer)!);
      case 129: 
        return PlaybackState.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class PlayerFlutterApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _PlayerFlutterApiCodec();

  void onPlaybackStateChange(PlaybackState playbackState);

  static void setup(PlayerFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onPlaybackStateChange', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onPlaybackStateChange was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PlaybackState? arg_playbackState = (args[0] as PlaybackState?);
          assert(arg_playbackState != null,
              'Argument for dev.flutter.pigeon.thinmpf.PlayerFlutterApi.onPlaybackStateChange was null, expected non-null PlaybackState.');
          try {
            api.onPlaybackStateChange(arg_playbackState!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
