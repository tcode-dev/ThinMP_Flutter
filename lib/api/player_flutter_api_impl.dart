import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';
import 'package:thinmpf/provider/playback_provider.dart';

class PlayerFlutterApiImpl implements PlayerFlutterApi {
  final WidgetRef ref;

  PlayerFlutterApiImpl(this.ref);

  @override
  void onPlaybackStateChange(PlaybackState playbackState) {
    ref.read(playbackProvider.notifier).updateState(playbackState);
  }
}
