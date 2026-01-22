// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/playlist_repository.dart';

part 'playlist_repository_factory_provider.g.dart';

@riverpod
PlaylistRepository playlistRepositoryFactory(PlaylistRepositoryFactoryRef ref) {
  return PlaylistRepository();
}
