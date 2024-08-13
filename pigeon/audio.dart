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
  Song({required this.id, required this.name, required this.albumId, required this.albumName, required this.artistId, required this.artistName, required this.imageId, required this.duration, required this.trackNumber});

  final String id;
  final String name;
  final String albumId;
  final String albumName;
  final String artistId;
  final String artistName;
  final String imageId;
  final double duration;
  final double trackNumber;
}

class Album {
  Album({required this.id, required this.name, required this.artistId, required this.artistName, required this.imageId});

  final String id;
  final String name;
  final String artistId;
  final String artistName;
  final String imageId;
}

class Artist {
  Artist(this.id, this.name);

  final String id;
  final String name;
}

///
/// HostApi
///
@HostApi()
abstract class SongHostApi {
  List<Song> getAllSongs();
  List<Song> getSongsByAlbumId(String albumId);
  List<Song> getSongsByArtistId(String artistId);
  // List<Song> getSongsByIds(List<String> ids);
}

@HostApi()
abstract class AlbumHostApi {
  List<Album> getAllAlbums();
  List<Album> getAlbumsByArtistId(String artistId);
  Album? getAlbumById(String id);
}

@HostApi()
abstract class ArtistHostApi {
  List<Artist> getAllArtists();
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
  void startAlbumSongs(int index, String albumId);
  void startArtistSongs(int index, String artistId);
  void play();
  void pause();
  void prev();
  void next();
  void seek(double time);
  double getCurrentTime();
}

///
/// FlutterApi
///
@FlutterApi()
abstract class PlayerFlutterApi {
  void onIsPlayingChange(bool isPlaying);
  void onPlaybackSongChange(Song song);
}
