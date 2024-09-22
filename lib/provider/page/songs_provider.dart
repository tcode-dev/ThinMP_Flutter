import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/repository/favorite_song_repository.dart';
import 'package:thinmpf/repository/playlist_repository.dart';

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

  Future<void> fetchPlaylistSongs(String id) async {
    final playlistRepository = PlaylistRepository();
    final playlist = playlistRepository.findById(ObjectId.fromHexString(id));

    if (playlist == null) {
      return;
    }

    final songIds = playlist.songIds.toList();
    final songs = await _songHostApi.getSongsByIds(songIds);

    state = songs.map((song) => song.fromPigeon()).toList();
  }
}
