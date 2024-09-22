import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';

part 'favorite_song_provider.g.dart';

@riverpod
class FavoriteSong extends _$FavoriteSong {
  @override
  bool build() {
    return isFavorite();
  }

  bool isFavorite() {
    final song = ref.watch(playbackSongProvider);

    if (song == null) {
      return false;
    }

    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);

    return favoriteSongRepository.exists(song.id);
  }

  void toggleFavorite() {
    final song = ref.read(playbackSongProvider);

    if (song == null) {
      return;
    }

    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);

    if (favoriteSongRepository.exists(song.id)) {
      favoriteSongRepository.delete(song.id);
      state = false;
    } else {
      favoriteSongRepository.add(song.id);
      state = true;
    }
  }
}
