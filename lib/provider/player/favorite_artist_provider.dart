// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';

part 'favorite_artist_provider.g.dart';

@riverpod
class FavoriteArtist extends _$FavoriteArtist {
  @override
  bool build() {
    return isFavorite();
  }

  bool isFavorite() {
    final song = ref.watch(playbackSongProvider);

    if (song == null) {
      return false;
    }

    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);

    return favoriteArtistRepository.exists(song.artistId);
  }

  void toggleFavorite() {
    final song = ref.read(playbackSongProvider);

    if (song == null) {
      return;
    }

    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);

    if (favoriteArtistRepository.exists(song.artistId)) {
      favoriteArtistRepository.delete(song.artistId);
      state = false;
    } else {
      favoriteArtistRepository.add(song.artistId);
      state = true;
    }
  }
}
