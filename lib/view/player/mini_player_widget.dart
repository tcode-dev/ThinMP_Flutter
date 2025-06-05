// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
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

    return Positioned(
      right: 0.0,
      bottom: 0.0,
      left: 0.0,
      child: Container(
        width: double.infinity,
        height: StyleConstant.row.contentBoxHeight + bottom,
        padding: EdgeInsets.only(bottom: bottom, left: StyleConstant.padding.small),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onInverseSurface),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlayerPageWidget()),
            );
          },
          child: Row(
            children: [
              Container(margin: EdgeInsets.only(right: StyleConstant.padding.small), child: SquareImageWidget(id: playbackSong.imageId, size: StyleConstant.image.tiny)),
              Expanded(child: TextWidget(text: playbackSong.name)),
              PlayPauseButtonWidget(size: StyleConstant.button.small, imageSize: StyleConstant.image.small),
              NextButtonWidget(size: StyleConstant.button.small, imageSize: StyleConstant.image.small),
            ],
          ),
        ),
      ),
    );
  }
}
