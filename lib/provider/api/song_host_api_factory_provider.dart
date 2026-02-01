// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'song_host_api_factory_provider.g.dart';

@riverpod
SongHostApi songHostApiFactory(Ref ref) {
  return SongHostApi();
}
