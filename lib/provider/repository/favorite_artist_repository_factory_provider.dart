import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';

part 'favorite_artist_repository_factory_provider.g.dart';

@riverpod
class FavoriteArtistRepositoryFactory extends _$FavoriteArtistRepositoryFactory {
  @override
  FavoriteArtistRepository build() {
    print('build FavoriteArtistRepository');
    final favoriteArtistRepository = FavoriteArtistRepository();
    ref.onDispose(() {
      print('onDispose FavoriteArtistRepository');
      favoriteArtistRepository.destroy();
    });
    return favoriteArtistRepository;
  }
}
