import 'package:pigeon/pigeon.dart';

class Song {
  String title;
  String artist;
  Song(this.title, this.artist);
}

@HostApi()
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/song.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Song.g.kt',
  kotlinOptions: KotlinOptions(),
  objcHeaderOut: 'ios/Runner/PigeonOutput/Pigeon.h',
  objcSourceOut: 'ios/Runner/PigeonOutput/Pigeon.m',
  swiftOptions: SwiftOptions(),
))
abstract class HostSongApi {
  List<Song> getSongs();
}
