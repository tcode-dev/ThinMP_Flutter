import 'package:pigeon/pigeon.dart';

@HostApi()
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/artwork.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Artwork.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: 'ArtworkFlutterError'),
  objcHeaderOut: 'ios/Runner/PigeonOutput/Artwork.h',
  objcSourceOut: 'ios/Runner/PigeonOutput/Artwork.m',
  swiftOut: 'ios/Runner/PigeonOutput/Artwork.g.swift',
  swiftOptions: SwiftOptions(),
))
abstract class HostArtworkApi {
  @async
  Uint8List? queryArtwork(String id);
}
