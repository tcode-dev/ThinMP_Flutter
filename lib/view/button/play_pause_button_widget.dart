import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/player/is_playing_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class PlayPauseButtonWidget extends ConsumerWidget {
  final double size;
  final double? imageSize;

  const PlayPauseButtonWidget({Key? key, required this.size, this.imageSize}) : super(key: key);

  void _play() {
    _player.play();
  }

  void _pause() {
    _player.pause();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);

    if (isPlaying) {
      return ButtonWidget(icon: Icons.pause_rounded, size: size, imageSize: imageSize, callback: _pause);
    } else {
      return ButtonWidget(icon: Icons.play_arrow_rounded, size: size, imageSize: imageSize, callback: _play);
    }
  }
}
