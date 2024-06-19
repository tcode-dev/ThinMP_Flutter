import 'package:pigeon/pigeon.dart';

class Player {
  int index;
  Player(this.index);
}

@HostApi()
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
abstract class HostPlayerApi {
  void play();
  void stop();
}
