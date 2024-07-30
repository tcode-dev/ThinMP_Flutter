import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';
import 'package:thinmpf/provider/playback_song_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/button/play_pause_button_widget.dart';
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
    final playbackSong = ref.watch(playbackSongProvider);

    if (playbackSong == null) {
      return Container();
    }

    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 10),
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
          Container(margin: const EdgeInsets.only(right: 10), child: ImageWidget(id: playbackSong.imageId, size: 40)),
          Expanded(child: Text(playbackSong.title, overflow: TextOverflow.ellipsis)),
          PlayPauseButtonWidget(),
          ButtonWidget(icon: Icons.skip_next_rounded, buttonSize: 50, imageSize: 44.0, callback: () => player.next()),
        ],
      ),
    );
  }
}
