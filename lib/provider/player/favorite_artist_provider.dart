import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';

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

    final repository = FavoriteArtistRepository();
    final exists = repository.exists(song.artistId);

    repository.destroy();

    return exists;
  }

  void toggleFavorite() {
    final song = ref.read(playbackSongProvider);

    if (song == null) {
      return;
    }

    final repository = FavoriteArtistRepository();

    try {
      if (repository.exists(song.artistId)) {
        repository.delete(song.artistId);
        state = false;
      } else {
        repository.add(song.artistId);
        state = true;
      }
    } finally {
      repository.destroy();
    }
  }
}
