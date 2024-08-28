import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view_model/songs_view_model.dart';

part 'songs_provider.g.dart';

final _songHostApi = SongHostApi();

@riverpod
class Songs extends _$Songs {
  @override
  Future<SongsViewModel> build() async {
    return fetchSongs();
  }

  Future<SongsViewModel> fetchSongs() async {
    final songs = await _songHostApi.getAllSongs();
    final songModels = songs.map((song) => song.fromPigeon()).toList();

    return SongsViewModel(
      songs: songModels,
    );
  }
}
