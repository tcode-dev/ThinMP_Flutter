import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/repository/playlist_repository.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view_model/playlist_detail_view_model.dart';

part 'playlist_detail_provider.g.dart';

final _songHostApi = SongHostApi();

@riverpod
class PlaylistDetail extends _$PlaylistDetail {
  @override
  Future<PlaylistDetailViewModel?> build(String id) async {
    return fetch(id);
  }

  Future<PlaylistDetailViewModel?> fetch(String id) async {
    final playlistRepository = PlaylistRepository();
    final playlist = playlistRepository.findById(ObjectId.fromHexString(id));

    if (playlist == null) {
      return null;
    }

    final songIds = playlist.songIds.toList();
    final songs = await _songHostApi.getSongsByIds(songIds);
    final songModels = songs.map((song) => song.fromPigeon()).toList();

    return PlaylistDetailViewModel(
      id: id,
      name: playlist.name,
      imageId: songModels.first.imageId,
      songs: songModels,
      songIds: songIds,
    );
  }

  void reload(String id) async {
    final data = await fetch(id);

    state = state = AsyncValue.data(data);
  }
}
