// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/favorite_artist_repository.dart';

part 'favorite_artist_repository_factory_provider.g.dart';

@riverpod
FavoriteArtistRepository favoriteArtistRepositoryFactory(FavoriteArtistRepositoryFactoryRef ref) {
  final favoriteArtistRepository = FavoriteArtistRepository();
  ref.onDispose(() {
    favoriteArtistRepository.dispose();
  });
  return favoriteArtistRepository;
}
