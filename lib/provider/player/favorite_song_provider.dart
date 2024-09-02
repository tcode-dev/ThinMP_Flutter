import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/repository/favorite_song_repository.dart';

part 'favorite_song_provider.g.dart';

@riverpod
class FavoriteSong extends _$FavoriteSong {
  @override
  bool build() {
    return isFavoriteSong();
  }

  bool isFavoriteSong() {
    final song = ref.watch(playbackSongProvider);

    if (song == null) {
      return false;
    }

    final repository = FavoriteSongRepository();

    return repository.exists(song.id);
  }

  void toggleFavoriteSong() {
    final song = ref.read(playbackSongProvider);

    if (song == null) {
      return;
    }

    final repository = FavoriteSongRepository();

    if (repository.exists(song.id)) {
      repository.delete(song.id);
      state = false;
    } else {
      repository.add(song.id);
      state = true;
    }
  }
}
