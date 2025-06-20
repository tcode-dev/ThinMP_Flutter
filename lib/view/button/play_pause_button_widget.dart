// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/player/is_playing_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class PlayPauseButtonWidget extends ConsumerStatefulWidget {
  final double size;
  final double? imageSize;

  const PlayPauseButtonWidget({super.key, required this.size, this.imageSize});

  @override
  PlayPauseButtonWidgetState createState() => PlayPauseButtonWidgetState();
}

class PlayPauseButtonWidgetState extends ConsumerState<PlayPauseButtonWidget> {
  void _play() {
    final playerApi = ref.read(playerApiFactoryProvider);

    playerApi.play();
  }

  void _pause() {
    final playerApi = ref.read(playerApiFactoryProvider);

    playerApi.pause();
  }

  @override
  Widget build(BuildContext context) {
    final isPlaying = ref.watch(isPlayingProvider);

    if (isPlaying) {
      return ButtonWidget(icon: Icons.pause_rounded, size: widget.size, imageSize: widget.imageSize, callback: _pause);
    } else {
      return ButtonWidget(icon: Icons.play_arrow_rounded, size: widget.size, imageSize: widget.imageSize, callback: _play);
    }
  }
}
