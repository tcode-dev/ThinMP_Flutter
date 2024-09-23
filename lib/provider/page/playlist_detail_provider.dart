import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/playlist_extension.dart';
import 'package:thinmpf/model/playlist_model.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';

part 'playlist_detail_provider.g.dart';

@riverpod
class PlaylistDetail extends _$PlaylistDetail {
  @override
  PlaylistModel? build() => null;

  void fetchPlaylist(String id) {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);
    final playlist = playlistRepository.findById(id);

    state = playlist?.fromRealm();
  }
}
