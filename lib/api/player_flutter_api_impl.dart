import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/is_playing_provider.dart';
import 'package:thinmpf/provider/playback_song_provider.dart';

class PlayerFlutterApiImpl implements PlayerFlutterApi {
  final WidgetRef ref;

  PlayerFlutterApiImpl(this.ref);

  @override
  void onIsPlayingChange(bool isPlaying) {
    ref.read(isPlayingProvider.notifier).updateState(isPlaying);
  }

  @override
  void onPlaybackSongChange(Song song) {
    ref.read(playbackSongProvider.notifier).updateState(song);
  }
}
