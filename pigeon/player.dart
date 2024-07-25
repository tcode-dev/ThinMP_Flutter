import 'package:pigeon/pigeon.dart';

// class Song {
//   String id;
//   String title;
//   String artist;
//   String imageId;

//   Song(this.id, this.title, this.artist, this.imageId);
// }

class PlaybackState {
  // Song song;
  bool isPlaying;

  PlaybackState(this.isPlaying);
}

class Player {
  int index;
  Player(this.index);
}

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/player.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Player.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: 'PlayerFlutterError'),
  objcHeaderOut: 'ios/Runner/PigeonOutput/Player.h',
  objcSourceOut: 'ios/Runner/PigeonOutput/Player.m',
  swiftOut: 'ios/Runner/PigeonOutput/Player.g.swift',
  swiftOptions: SwiftOptions(),
))

@HostApi()
abstract class PlayerHostApi {
  void startBySongs(int index);
  void play();
  void stop();
  PlaybackState getPlaybackState();
}

@FlutterApi()
abstract class PlayerFlutterApi {
  void playbackStateChange(String str);
}