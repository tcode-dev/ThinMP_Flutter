// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/favorite_song_repository.dart';

part 'favorite_song_repository_factory_provider.g.dart';

@riverpod
FavoriteSongRepository favoriteSongRepositoryFactory(Ref ref) {
  return FavoriteSongRepository();
}
