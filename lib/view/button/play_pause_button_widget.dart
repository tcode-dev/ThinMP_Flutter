import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';
import 'package:thinmpf/provider/is_playing_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class PlayPauseButtonWidget extends ConsumerStatefulWidget {
  final SizeConstant size;

  const PlayPauseButtonWidget({Key? key, required this.size}) : super(key: key);

  @override
  MiniPlayerWidgetState createState() => MiniPlayerWidgetState();
}

class MiniPlayerWidgetState extends ConsumerState<PlayPauseButtonWidget> {
  final PlayerHostApi player = PlayerHostApi();

  @override
  Widget build(BuildContext context) {
    final isPlaying = ref.watch(isPlayingProvider);

    if (isPlaying) {
      return ButtonWidget(icon: Icons.pause_rounded, size: widget.size, callback: () => player.pause());
    } else {
      return ButtonWidget(icon: Icons.play_arrow_rounded, size: widget.size, callback: () => player.play());
    }
  }
}
