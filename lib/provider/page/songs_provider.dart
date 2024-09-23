import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/provider/api/song_host_api_factory_provider.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';

part 'songs_provider.g.dart';

@riverpod
class Songs extends _$Songs {
  @override
  List<SongModel> build() => [];

  Future<void> fetchAllSongs() async {
    final songHostApi = ref.read(songHostApiFactoryProvider);
    final songs = await songHostApi.getAllSongs();

    state = songs.map((song) => song.fromPigeon()).toList();
  }

  Future<void> fetchArtistSongs(String id) async {
    final songHostApi = ref.read(songHostApiFactoryProvider);
    final songs = await songHostApi.getSongsByArtistId(id);

    state = songs.map((song) => song.fromPigeon()).toList();
  }

  Future<void> fetchAlbumSongs(String id) async {
    final songHostApi = ref.read(songHostApiFactoryProvider);
    final songs = await songHostApi.getSongsByAlbumId(id);

    state = songs.map((song) => song.fromPigeon()).toList();
  }

  Future<void> fetchFavoriteSongs() async {
    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);
    final songHostApi = ref.read(songHostApiFactoryProvider);
    final favoriteSongs = favoriteSongRepository.findAll();
    final favoriteSongIds = favoriteSongs.map((song) => song.songId).toList();
    final songs = await songHostApi.getSongsByIds(favoriteSongIds);

    state = songs.map((song) => song.fromPigeon()).toList();
  }

  Future<void> fetchPlaylistSongs(String id) async {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);
    final songHostApi = ref.read(songHostApiFactoryProvider);
    final playlist = playlistRepository.findById(id);

    if (playlist == null) {
      return;
    }

    final songIds = playlist.songIds.toList();
    final songs = await songHostApi.getSongsByIds(songIds);

    state = songs.map((song) => song.fromPigeon()).toList();
  }
}
