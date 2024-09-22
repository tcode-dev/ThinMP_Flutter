import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';

part 'favorite_artist_repository_factory_provider.g.dart';

@riverpod
class FavoriteArtistRepositoryFactory extends _$FavoriteArtistRepositoryFactory {
  @override
  FavoriteArtistRepository build() {
    final favoriteArtistRepository = FavoriteArtistRepository();
    ref.onDispose(() {
      favoriteArtistRepository.destroy();
    });
    return favoriteArtistRepository;
  }
}
