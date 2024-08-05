import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/playback_song_provider.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class PlayerPageWidget extends ConsumerStatefulWidget {
  const PlayerPageWidget({super.key});

  @override
  PlayerPageWidgetState createState() => PlayerPageWidgetState();
}

class PlayerPageWidgetState extends ConsumerState<PlayerPageWidget> {
  final PlayerHostApi player = PlayerHostApi();

  @override
  Widget build(BuildContext context) {
    final playbackSong = ref.watch(playbackSongProvider);

    if (playbackSong == null) {
      return Container();
    }

    Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: Blur(
              blur: 15,
              blurColor: Colors.white,
              child: ImageWidget(id: playbackSong.imageId, size: screenSize.width),
            ),
          ),
          Positioned(
            top: screenSize.width * 0.15,
            left: screenSize.width * 0.15,
            child: ImageWidget(id: playbackSong.imageId, size: screenSize.width * 0.7),
          ),
        ],
      ),
    );
  }
}
