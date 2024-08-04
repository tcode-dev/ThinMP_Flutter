import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/audio.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Audio.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: 'FlutterError'),
  objcHeaderOut: 'ios/Runner/PigeonOutput/Audio.h',
  objcSourceOut: 'ios/Runner/PigeonOutput/Audio.m',
  swiftOut: 'ios/Runner/PigeonOutput/Audio.g.swift',
  swiftOptions: SwiftOptions(),
))

class Song {
  String id;
  String title;
  String artist;
  String imageId;

  Song(this.id, this.title, this.artist, this.imageId);
}

/// HostApi
@HostApi()
abstract class ArtworkHostApi {
  @async
  Uint8List? queryArtwork(String id);
}

@HostApi()
abstract class PlayerHostApi {
  void startBySongs(int index);
  void play();
  void pause();
  void prev();
  void next();
}

@HostApi()
abstract class SongHostApi {
  List<Song> findAll();
}

/// FlutterApi
@FlutterApi()
abstract class PlayerFlutterApi {
  void onIsPlayingChange(bool isPlaying);
  void onPlaybackSongChange(Song song);
}
