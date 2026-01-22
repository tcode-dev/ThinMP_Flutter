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
    _checkFavorite();
    return false;
  }

  Future<void> _checkFavorite() async {
    final song = ref.watch(playbackSongProvider);

    if (song == null) {
      state = false;
      return;
    }

    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final isFavorite = await favoriteArtistRepository.exists(song.artistId);
    state = isFavorite;
  }

  Future<void> toggleFavorite() async {
    final song = ref.read(playbackSongProvider);

    if (song == null) {
      return;
    }

    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final isFavorite = await favoriteArtistRepository.exists(song.artistId);

    if (isFavorite) {
      await favoriteArtistRepository.delete(song.artistId);
      state = false;
    } else {
      await favoriteArtistRepository.add(song.artistId);
      state = true;
    }
  }
}
