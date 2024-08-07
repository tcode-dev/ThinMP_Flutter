import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/playback_song_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/button/favorite_artist_button_widget.dart';
import 'package:thinmpf/view/button/favorite_song_button_widget.dart';
import 'package:thinmpf/view/button/next_button_widget.dart';
import 'package:thinmpf/view/button/play_pause_button_widget.dart';
import 'package:thinmpf/view/button/prev_button_widget.dart';
import 'package:thinmpf/view/button/repeat_button_widget.dart';
import 'package:thinmpf/view/button/shuffle_button_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/slider/slider_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

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
          Positioned(
            top: screenSize.height * 0.48,
            width: screenSize.width,
            child: TextWidget(text: playbackSong.title, textAlign: TextAlign.center),
          ),
          Positioned(
            top: screenSize.height * 0.51,
            width: screenSize.width,
            child: TextWidget(text: playbackSong.artist, textAlign: TextAlign.center),
          ),
          Positioned(
            top: screenSize.height * 0.55,
            width: screenSize.width,
            child: const SliderWidget(),
          ),
          Positioned(
            top: screenSize.height * 0.65,
            width: screenSize.width,
            child: const Row(children: [
              Spacer(),
              PrevButtonWidget(size: SizeConstant.medium),
              Spacer(),
              PlayPauseButtonWidget(size: SizeConstant.large),
              Spacer(),
              NextButtonWidget(size: SizeConstant.medium),
              Spacer(),
            ]),
          ),
          Positioned(
            top: screenSize.height * 0.8,
            width: screenSize.width,
            child: const Row(children: [
              Spacer(),
              RepeatButtonWidget(),
              Spacer(),
              ShuffleButtonWidget(),
              Spacer(),
              FavoriteArtistButtonWidget(),
              Spacer(),
              FavoriteSongButtonWidget(),
              Spacer(),
            ]),
          ),
        ],
      ),
    );
  }
}
