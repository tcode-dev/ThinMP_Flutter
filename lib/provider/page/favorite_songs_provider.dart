import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/repository/favorite_song_repository.dart';
import 'package:thinmpf/view_model/favorite_songs_view_model.dart';

part 'favorite_songs_provider.g.dart';

final _songHostApi = SongHostApi();
final _favoriteSongRepository = FavoriteSongRepository();

@riverpod
class FavoriteSongs extends _$FavoriteSongs {
  @override
  Future<FavoriteSongsViewModel> build() async {
    return fetchSongs();
  }

  Future<FavoriteSongsViewModel> fetchSongs() async {
    final favoriteSongsIds = _favoriteSongRepository.findAllSongIds();
    final songs = await _songHostApi.getSongsByIds(favoriteSongsIds);
    final songModels = songs.map((song) => song.fromPigeon()).toList();

    return FavoriteSongsViewModel(
      songs: songModels,
      songIds: favoriteSongsIds
    );
  }
}
