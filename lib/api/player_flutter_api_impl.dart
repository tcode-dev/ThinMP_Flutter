import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/player/is_playing_provider.dart';
import 'package:thinmpf/provider/player/playback_error_provider.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';

class PlayerFlutterApiImpl implements PlayerFlutterApi {
  final WidgetRef ref;

  PlayerFlutterApiImpl(this.ref);

  @override
  void onIsPlayingChange(bool isPlaying) {
    if (ref.read(isPlayingProvider) != isPlaying) {
      ref.read(isPlayingProvider.notifier).setIsPlaying(isPlaying);
    }
  }

  @override
  void onPlaybackSongChange(SongDTO song) {
    if (ref.read(playbackSongProvider)?.id != song.id) {
      ref.read(playbackSongProvider.notifier).setPlaybackSong(song);
    }
  }

  @override
  void onError(String message) {
    ref.read(playbackErrorProvider.notifier).notify(message);
  }
}
