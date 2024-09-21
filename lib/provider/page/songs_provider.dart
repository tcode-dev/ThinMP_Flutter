import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/repository/favorite_song_repository.dart';

part 'songs_provider.g.dart';

final _songHostApi = SongHostApi();

@riverpod
class Songs extends _$Songs {
  @override
  List<SongModel> build() => [];

  Future<void> fetchAllSongs() async {
    final songs = await _songHostApi.getAllSongs();

    state = songs.map((song) => song.fromPigeon()).toList();
  }

  Future<void> fetchArtistSongs(String id) async {
    final songs = await _songHostApi.getSongsByArtistId(id);

    state = songs.map((song) => song.fromPigeon()).toList();
  }

  Future<void> fetchFavoriteSongs() async {
    final favoriteSongRepository = FavoriteSongRepository();

    try {
      final favoriteSongs = favoriteSongRepository.findAll();
      final favoriteSongIds = favoriteSongs.map((song) => song.songId).toList();
      final songs = await _songHostApi.getSongsByIds(favoriteSongIds);

      state = songs.map((song) => song.fromPigeon()).toList();
    } finally {
      favoriteSongRepository.destroy();
    }
  }
}
