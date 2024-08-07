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
  Song(this.id, this.title, this.artist, this.imageId, this.duration);

  final String id;
  final String title;
  final String artist;
  final String imageId;
  final double duration;
}

class Album {
  Album(this.id, this.title, this.artist, this.imageId);

  final String id;
  final String title;
  final String artist;
  final String imageId;
}

/// HostApi
@HostApi()
abstract class AlbumHostApi {
  List<Album> getAllAlbums();
}

@HostApi()
abstract class ArtworkHostApi {
  @async
  Uint8List? queryArtwork(String id);
}

@HostApi()
abstract class PlayerHostApi {
  // void start(int index, List<String> ids);
  void startAllSongs(int index);
  // void startAlbumSongs(int index, String albumId);
  // void startArtistSongs(int index, String artistId);
  void play();
  void pause();
  void prev();
  void next();
  void seek(double time);
  double getCurrentTime();
}

@HostApi()
abstract class SongHostApi {
  List<Song> getAllSongs();
  // List<Song> getSongsByIds(List<String> ids);
  // List<Song> getSongsByAlbumId(String albumId);
  // List<Song> getSongsByArtistId(String artistId);
}

/// FlutterApi
@FlutterApi()
abstract class PlayerFlutterApi {
  void onIsPlayingChange(bool isPlaying);
  void onPlaybackSongChange(Song song);
}
