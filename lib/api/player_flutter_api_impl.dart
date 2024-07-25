import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';
import 'package:thinmpf/provider/playback_state_provider.dart';

class PlayerFlutterApiImpl implements PlayerFlutterApi {
  final ProviderContainer container;

  PlayerFlutterApiImpl(this.container);

  @override
  void onPlaybackStateChange(PlaybackState playbackState) {
    container.read(playbackStateProvider.notifier).state = playbackState;
  }
}
