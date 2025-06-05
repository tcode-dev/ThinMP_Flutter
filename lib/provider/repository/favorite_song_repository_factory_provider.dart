// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/favorite_song_repository.dart';

part 'favorite_song_repository_factory_provider.g.dart';

@riverpod
FavoriteSongRepository favoriteSongRepositoryFactory(FavoriteSongRepositoryFactoryRef ref) {
  final favoriteSongRepository = FavoriteSongRepository();
  ref.onDispose(() {
    favoriteSongRepository.dispose();
  });
  return favoriteSongRepository;
}
