import 'package:pigeon/pigeon.dart';

class Song {
  String? title;
  String? artist;
}

@HostApi()
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/song.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Song.g.kt',
  kotlinOptions: KotlinOptions(),
  swiftOut: 'ios/Runner/pigeon_output/Song.g.swift',
  swiftOptions: SwiftOptions(),
))
abstract class HostSongApi {
  List<Song> getSongs();
}
