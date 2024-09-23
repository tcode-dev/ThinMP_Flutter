import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/playlist_extension.dart';
import 'package:thinmpf/model/playlist_model.dart';
import 'package:thinmpf/repository/playlist_repository.dart';

part 'playlists_provider.g.dart';

@riverpod
class Playlists extends _$Playlists {
  @override
  List<PlaylistModel> build() => [];

  void fetchPlaylists() {
    final playlistRepository = PlaylistRepository();

    try {
      final playlists = playlistRepository.findAll();

      state = playlists.map((playlist) => playlist.fromRealm()).toList();
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
}
