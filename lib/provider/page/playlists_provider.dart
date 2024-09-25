import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/playlist_extension.dart';
import 'package:thinmpf/model/playlist_model.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';

part 'playlists_provider.g.dart';

@riverpod
class Playlists extends _$Playlists {
  @override
  List<PlaylistModel> build() => [];

  void fetchPlaylists() {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);
    final playlists = playlistRepository.findAllSortedByAsc();

    state = playlists.map((playlist) => playlist.fromRealm()).toList();
  }

  void create(String name, String songId) {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

    playlistRepository.create(name, songId);
  }

  void add(String playlistId, String songId) {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

    playlistRepository.add(playlistId, songId);
  }
}
