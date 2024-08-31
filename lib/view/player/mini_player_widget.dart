import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/view/button/next_button_widget.dart';
import 'package:thinmpf/view/button/play_pause_button_widget.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/page/player_page_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class MiniPlayerWidget extends ConsumerStatefulWidget {
  const MiniPlayerWidget({super.key});

  @override
  MiniPlayerWidgetState createState() => MiniPlayerWidgetState();
}

class MiniPlayerWidgetState extends ConsumerState<MiniPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    final playbackSong = ref.watch(playbackSongProvider);

    if (playbackSong == null) {
      return Container();
    }

    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      height: StyleConstant.height.contentBox + bottom,
      padding: EdgeInsets.only(bottom: bottom, left: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        border: const Border(
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
            Container(margin: const EdgeInsets.only(right: 10), child: SquareImageWidget(id: playbackSong.imageId, size: StyleConstant.image.small)),
            Expanded(child: TextWidget(text: playbackSong.name)),
            const PlayPauseButtonWidget(size: 50.0, imageSize: 44.0),
            const NextButtonWidget(size: 50.0, imageSize: 44.0),
          ],
        ),
      ),
    );
  }
}
