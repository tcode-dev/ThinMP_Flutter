import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';

part 'playback_provider.g.dart';

@riverpod
class Playback extends _$Playback {
  @override
  PlaybackState build() => PlaybackState(isPlaying: false, song: null);

  void updateState(PlaybackState playbackState) {
    state = playbackState;
  }
}