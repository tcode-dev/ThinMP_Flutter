import 'package:pigeon/pigeon.dart';

class Song {
  String id;
  String title;
  String artist;
  Song(this.id, this.title, this.artist);
}

@HostApi()
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/song.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Song.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: 'SongFlutterError'),
  objcHeaderOut: 'ios/Runner/PigeonOutput/Song.h',
  objcSourceOut: 'ios/Runner/PigeonOutput/Song.m',
  swiftOut: 'ios/Runner/PigeonOutput/Song.g.swift',
  swiftOptions: SwiftOptions(),
))
abstract class HostSongApi {
  List<Song> findAll();
}
