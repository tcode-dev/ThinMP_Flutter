// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/extension/playlist_extension.dart';
import 'package:thinmpf/model/media/playlist_model.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';

part 'playlist_detail_provider.g.dart';

@riverpod
class PlaylistDetail extends _$PlaylistDetail {
  @override
  PlaylistModel? build(String id) => null;

  Future<void> fetchPlaylist(String id) async {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);
    final playlist = await playlistRepository.findById(id);

    state = playlist?.toPlaylistModel();
  }

  Future<void> refetch(String id) async {
    await fetchPlaylist(id);
  }
}
