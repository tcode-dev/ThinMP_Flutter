// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/favorite_artist_repository.dart';

part 'favorite_artist_repository_factory_provider.g.dart';

@riverpod
FavoriteArtistRepository favoriteArtistRepositoryFactory(Ref ref) {
  return FavoriteArtistRepository();
}
