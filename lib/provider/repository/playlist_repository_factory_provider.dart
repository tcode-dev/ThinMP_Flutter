// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/playlist_repository.dart';

part 'playlist_repository_factory_provider.g.dart';

@riverpod
PlaylistRepository playlistRepositoryFactory(Ref ref) {
  return PlaylistRepository();
}
