// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';

part 'favorite_song_provider.g.dart';

@riverpod
class FavoriteSong extends _$FavoriteSong {
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

    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);
    final isFavorite = await favoriteSongRepository.exists(song.id);
    state = isFavorite;
  }

  Future<void> toggleFavorite() async {
    final song = ref.read(playbackSongProvider);

    if (song == null) {
      return;
    }

    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);
    final isFavorite = await favoriteSongRepository.exists(song.id);

    if (isFavorite) {
      await favoriteSongRepository.delete(song.id);
      state = false;
    } else {
      await favoriteSongRepository.add(song.id);
      state = true;
    }
  }
}
