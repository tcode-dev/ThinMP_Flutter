import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';
import 'package:thinmpf/provider/playback_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class MiniPlayerWidget extends ConsumerStatefulWidget {

  const MiniPlayerWidget({super.key});

  @override
  MiniPlayerWidgetState createState() => MiniPlayerWidgetState();
}

class MiniPlayerWidgetState extends ConsumerState<MiniPlayerWidget> {
  final PlayerHostApi player = PlayerHostApi();

  @override
  Widget build(BuildContext context) {
    final playbackState = ref.watch(playbackProvider);
    final song = playbackState.song;

    if (song == null) {
      return Container();
    }

    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0x1F000000),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(width: 40, height: 40, margin: const EdgeInsets.only(right: 10), child: ImageWidget(id: song.imageId, size: 40)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.title, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          playbackState.isPlaying
              ? ButtonWidget(icon: Icons.pause_rounded, buttonSize: 50, imageSize: 44.0, callback: () => player.pause())
              : ButtonWidget(icon: Icons.play_arrow_rounded, buttonSize: 50, imageSize: 44.0, callback: () => player.play()),
          ButtonWidget(icon: Icons.skip_next_rounded, buttonSize: 50, imageSize: 44.0, callback: () => player.next()),
        ],
      ),
    );
  }
}
