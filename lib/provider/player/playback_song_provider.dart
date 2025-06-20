// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/model/media/song_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'playback_song_provider.g.dart';

@riverpod
class PlaybackSong extends _$PlaybackSong {
  @override
  SongModel? build() => null;

  void setPlaybackSong(SongDTO song) {
    state = song.fromPigeon();
  }
}
