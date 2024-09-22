import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/playlist_extension.dart';
import 'package:thinmpf/repository/playlist_repository.dart';
import 'package:thinmpf/view_model/playlists_view_model.dart';

part 'playlists_provider.g.dart';

@riverpod
class Playlists extends _$Playlists {
  @override
  Future<PlaylistsViewModel> build() async {
    return fetch();
  }

  Future<PlaylistsViewModel> fetch() async {
    final playlistRepository = PlaylistRepository();

    try {
      final playlists = playlistRepository.findAll();
      final playlistModels = playlists.map((playlist) => playlist.fromRealm()).toList();

      return PlaylistsViewModel(playlists: playlistModels);
    } finally {
      playlistRepository.dispose();
    }
  }

  void create(String name, String songId) {
    final repository = PlaylistRepository();

    try {
      repository.create(name, songId);
    } finally {
      repository.dispose();
    }
  }

  void add(String playlistId, String songId) {
    final repository = PlaylistRepository();

    try {
      repository.add(playlistId, songId);
    } finally {
      repository.dispose();
    }
  }

  void reload() async {
    final data = await fetch();

    state = state = AsyncValue.data(data);
  }
}
