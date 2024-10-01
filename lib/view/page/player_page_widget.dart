import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/button/favorite_artist_button_widget.dart';
import 'package:thinmpf/view/button/favorite_song_button_widget.dart';
import 'package:thinmpf/view/button/next_button_widget.dart';
import 'package:thinmpf/view/button/play_pause_button_widget.dart';
import 'package:thinmpf/view/button/playlist_button_widget.dart';
import 'package:thinmpf/view/button/prev_button_widget.dart';
import 'package:thinmpf/view/button/repeat_button_widget.dart';
import 'package:thinmpf/view/button/shuffle_button_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/slider/slider_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class PlayerPageWidget extends ConsumerStatefulWidget {
  const PlayerPageWidget({super.key});

  @override
  PlayerPageWidgetState createState() => PlayerPageWidgetState();
}

class PlayerPageWidgetState extends ConsumerState<PlayerPageWidget> {
  @override
  Widget build(BuildContext context) {
    final playbackSong = ref.watch(playbackSongProvider);

    if (playbackSong == null) {
      return Container();
    }

    final screenSize = MediaQuery.sizeOf(context);
    final top = MediaQuery.of(context).padding.top;
    final bottom = MediaQuery.of(context).padding.bottom;
    final appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            child: Stack(
              children: [
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Blur(
                    blur: 10,
                    blurColor: Colors.white,
                    child: ImageWidget(id: playbackSong.imageId, size: screenSize.width),
                  ),
                ),
                Positioned(
                  top: screenSize.width - 200,
                  width: screenSize.width,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context).transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: appBarHeight,
            left: 0.0,
            child: const BackButton(),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(top: top, bottom: bottom),
              child: Column(
                children: [
                  const Spacer(),
                  Center(child: SquareImageWidget(id: playbackSong.imageId, size: screenSize.width * 0.65)),
                  const Spacer(),
                  Column(children: [
                    TextWidget(text: playbackSong.name, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
                    TextWidget(text: playbackSong.artistName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                  ]),
                  const Spacer(),
                  const SliderWidget(),
                  const Spacer(),
                  Row(children: [
                    const Spacer(),
                    const PrevButtonWidget(),
                    const Spacer(),
                    PlayPauseButtonWidget(size: StyleConstant.button.large),
                    const Spacer(),
                    NextButtonWidget(size: StyleConstant.button.medium),
                    const Spacer(),
                  ]),
                  const Spacer(),
                  const Row(
                    children: [
                      Spacer(),
                      RepeatButtonWidget(),
                      Spacer(),
                      ShuffleButtonWidget(),
                      Spacer(),
                      FavoriteArtistButtonWidget(),
                      Spacer(),
                      FavoriteSongButtonWidget(),
                      Spacer(),
                      PlaylistButtonWidget(),
                      Spacer(),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
