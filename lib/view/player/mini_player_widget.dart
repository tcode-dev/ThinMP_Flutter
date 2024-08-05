import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/playback_song_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/button/play_pause_button_widget.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/page/player_page_widget.dart';

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

    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      height: styleConstant[StyleType.height][SizeConstant.small] + bottom,
      padding: EdgeInsets.only(bottom: bottom, left: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0x1F000000),
            width: 1,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlayerPageWidget()),
          );
        },
        child: Row(
          children: [
            Container(margin: const EdgeInsets.only(right: 10), child: SquareImageWidget(id: playbackSong.imageId, size: styleConstant[StyleType.image][SizeConstant.small])),
            Expanded(child: Text(playbackSong.title, overflow: TextOverflow.ellipsis)),
            PlayPauseButtonWidget(size: SizeConstant.small),
            ButtonWidget(icon: Icons.skip_next_rounded, size: SizeConstant.small, callback: () => player.next()),
          ],
        ),
      ),
    );
  }
}
