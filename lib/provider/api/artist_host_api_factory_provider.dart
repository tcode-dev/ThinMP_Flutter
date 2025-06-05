// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'artist_host_api_factory_provider.g.dart';

@riverpod
ArtistHostApi artistHostApiFactory(ArtistHostApiFactoryRef ref) {
  return ArtistHostApi();
}
