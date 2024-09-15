import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/repository/favorite_song_repository.dart';
import 'package:thinmpf/view_model/favorite_songs_view_model.dart';

part 'favorite_songs_provider.g.dart';

final _songHostApi = SongHostApi();

@riverpod
class FavoriteSongs extends _$FavoriteSongs {
  @override
  Future<FavoriteSongsViewModel> build() async {
    return fetch();
  }

  Future<FavoriteSongsViewModel> fetch() async {
    final favoriteSongRepository = FavoriteSongRepository();

    try {
      final favoriteSongs = favoriteSongRepository.findAll();
      final favoriteSongIds = favoriteSongs.map((song) => song.songId).toList();
      final songs = await _songHostApi.getSongsByIds(favoriteSongIds);
      final songModels = songs.map((song) => song.fromPigeon()).toList();

      return FavoriteSongsViewModel(songs: songModels, songIds: favoriteSongIds);
    } finally {
      favoriteSongRepository.destroy();
    }
  }

  void reload() async {
    final data = await fetch();

    state = state = AsyncValue.data(data);
  }
}
