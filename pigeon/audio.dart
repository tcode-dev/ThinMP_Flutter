import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/audio.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Audio.g.kt',
  kotlinOptions: KotlinOptions(
    package: 'dev.tcode.thinmpf.pigeon_output',
    errorClassName: 'FlutterError',
  ),
  objcHeaderOut: 'ios/Runner/PigeonOutput/Audio.h',
  objcSourceOut: 'ios/Runner/PigeonOutput/Audio.m',
  swiftOut: 'ios/Runner/PigeonOutput/Audio.g.swift',
  swiftOptions: SwiftOptions(),
))
class SongDTO {
  SongDTO({
    required this.id,
    required this.name,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.imageId,
    required this.duration,
    required this.trackNumber,
  });

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

class AlbumDTO {
  AlbumDTO({required this.id, required this.name, required this.artistId, required this.artistName, required this.imageId});

  final String id;
  final String name;
  final String artistId;
  final String artistName;
  final String imageId;
}

class ArtistDTO {
  ArtistDTO(this.id, this.name);

  final String id;
  final String name;
}

class ArtistDetailDTO {
  ArtistDetailDTO(this.id, this.name, this.imageId);

  final String id;
  final String name;
  final String imageId;
}

enum RepeatMode { off, one, all }

enum ShuffleMode { off, on }

///
/// HostApi
///
@HostApi()
abstract class SongHostApi {
  List<SongDTO> getAllSongs();
  List<SongDTO> getSongsByAlbumId(String albumId);
  List<SongDTO> getSongsByArtistId(String artistId);
  List<SongDTO> getSongsByIds(List<String> ids);
  SongDTO? getSongById(String id);
}

@HostApi()
abstract class AlbumHostApi {
  List<AlbumDTO> getAllAlbums();
  List<AlbumDTO> getAlbumsByArtistId(String artistId);
  List<AlbumDTO> getRecentAlbums(int count);
  AlbumDTO? getAlbumById(String id);
}

@HostApi()
abstract class ArtistHostApi {
  List<ArtistDTO> getAllArtists();
  ArtistDetailDTO? getArtistDetailById(String id);
  List<ArtistDTO> getArtistsByIds(List<String> ids);
}

@HostApi()
abstract class ArtworkHostApi {
  @async
  Uint8List? getArtwork(String id);
}

@HostApi()
abstract class PlayerHostApi {
  void start(int index, List<String> ids, RepeatMode repeatMode, ShuffleMode shuffleMode);
  void startAllSongs(int index, RepeatMode repeatMode, ShuffleMode shuffleMode);
  void startAlbumSongs(int index, String albumId, RepeatMode repeatMode, ShuffleMode shuffleMode);
  void startArtistSongs(int index, String artistId, RepeatMode repeatMode, ShuffleMode shuffleMode);
  void play();
  void pause();
  void prev();
  void next();
  void seek(double time);
  void setRepeat(RepeatMode repeatMode);
  void setShuffle(ShuffleMode shuffleMode);
  double getCurrentTime();
}

///
/// FlutterApi
///
@FlutterApi()
abstract class PlayerFlutterApi {
  void onIsPlayingChange(bool isPlaying);
  void onPlaybackSongChange(SongDTO song);
  void onError(String message);
}
