import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';

part 'playback_song_provider.g.dart';

@riverpod
class PlaybackSong extends _$PlaybackSong {
  @override
  Song2? build() => null;

  void updateState(Song2 song) {
    state = song;
  }
}