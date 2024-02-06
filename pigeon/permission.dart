import 'package:pigeon/pigeon.dart';

class Permission {
  bool media;
  Permission(this.media);
}

@HostApi()
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon_output/permission.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/dev/tcode/thinmpf/pigeon_output/Permission.g.kt',
  kotlinOptions: KotlinOptions(),
  objcHeaderOut: 'ios/Runner/PigeonOutput/Permission.h',
  objcSourceOut: 'ios/Runner/PigeonOutput/Permission.m',
  swiftOut: 'ios/Runner/PigeonOutput/Permission.g.swift',
  swiftOptions: SwiftOptions(),
))
abstract class HostPermissionApi {
  List<Permission> findAll();
}
