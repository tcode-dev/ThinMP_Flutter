// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'song_host_api_factory_provider.g.dart';

@riverpod
SongHostApi songHostApiFactory(SongHostApiFactoryRef ref) {
  return SongHostApi();
}
