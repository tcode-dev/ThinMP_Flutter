import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'playback_song_provider.g.dart';

@riverpod
class PlaybackSong extends _$PlaybackSong {
  @override
  Song? build() => null;

  void setPlaybackSong(Song song) {
    state = song;
  }
}
