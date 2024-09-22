import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/playlist_extension.dart';
import 'package:thinmpf/model/playlist_model.dart';
import 'package:thinmpf/repository/playlist_repository.dart';

part 'playlist_detail_provider.g.dart';

@riverpod
class PlaylistDetail extends _$PlaylistDetail {
  @override
  PlaylistModel? build() => null;

  void fetchPlaylist(String id) {
    final playlistRepository = PlaylistRepository();

    try {
      final playlist = playlistRepository.findById(ObjectId.fromHexString(id));

      state = playlist?.fromRealm();
    } finally {
      playlistRepository.destroy();
    }
  }
}
