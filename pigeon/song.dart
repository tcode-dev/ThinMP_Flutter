import 'package:pigeon/pigeon.dart';

class Song {
  String? title;
  String? artist;
}

@HostApi()
abstract class HostSongApi {
  List<Song> getSongs();
}

// @ConfigurePigeon(PigeonOptions(
//   dartOut: 'lib/src/song.g.dart',
//   dartOptions: DartOptions(),
//   kotlinOut: 'android/app/src/main/kotlin/dev/flutter/pigeon_example_app/Messages.g.kt',
//   kotlinOptions: KotlinOptions(),
//   swiftOut: 'ios/Runner/Song.g.swift',
//   swiftOptions: SwiftOptions(),
// ))

// @ConfigurePigeon(PigeonOptions(
//   dartOut: 'lib/src/messages.g.dart',
//   dartOptions: DartOptions(),
//   cppOptions: CppOptions(namespace: 'pigeon_example'),
//   cppHeaderOut: 'windows/runner/messages.g.h',
//   cppSourceOut: 'windows/runner/messages.g.cpp',
//   kotlinOut:
//       'android/app/src/main/kotlin/dev/flutter/pigeon_example_app/Messages.g.kt',
//   kotlinOptions: KotlinOptions(),
//   javaOut: 'android/app/src/main/java/io/flutter/plugins/Messages.java',
//   javaOptions: JavaOptions(),
//   swiftOut: 'ios/Runner/Messages.g.swift',
//   swiftOptions: SwiftOptions(),
//   objcHeaderOut: 'macos/Runner/messages.g.h',
//   objcSourceOut: 'macos/Runner/messages.g.m',
//   // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
//   objcOptions: ObjcOptions(prefix: 'PGN'),
//   copyrightHeader: 'pigeons/copyright.txt',
//   dartPackageName: 'pigeon_example_package',
// ))

// class SearchRequest {
//   late String query;
// }

// class SearchReply {
//   late String result;
// }

// @ConfigurePigeon(PigeonOptions(
//   objcOptions: ObjcOptions(prefix: 'FLT'),
//   javaOptions: JavaOptions(
//     package: 'com.example.search',
//   ),
// ))
// abstract class SearchApi {
//   SearchReply search(SearchRequest request);
// }

