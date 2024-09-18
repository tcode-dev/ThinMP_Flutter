import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

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
}
