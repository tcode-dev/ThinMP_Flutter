import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/util/device_util.dart';
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

    final mediaQuery = MediaQuery.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    final isTablet = isTabletDevice(context);
    final shortestSide = mediaQuery.size.shortestSide;
    final longestSide = mediaQuery.size.longestSide;
    final ratio = shortestSide / longestSide;
    final width = screenSize.width;
    final height = screenSize.height;
    final containerHeight = isTablet
        ? isPortrait(context)
            ? height * 0.8
            : height * 0.9
        : height;
    final containerWidth = isTablet ? containerHeight * ratio : width;
    final containerRadius = isTablet ? StyleConstant.radius.medium : 0.0;
    final containerAlpha = isTablet ? 100 : 0;
    final backgroundImageSize = isTablet ? longestSide : shortestSide;
    final imageSize = isTablet ? containerHeight * 0.4 : height * 0.3;

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
                  bottom: isTablet ? 0 : null,
                  left: 0.0,
                  child: Blur(
                    blur: 10,
                    blurColor: Theme.of(context).scaffoldBackgroundColor,
                    child: ImageWidget(id: playbackSong.imageId, size: backgroundImageSize, useFallbackImage: false),
                  ),
                ),
                isTablet
                    ? Container()
                    : Positioned(
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
            child: Center(
              child: Container(
                width: containerWidth,
                height: containerHeight,
                padding: EdgeInsets.only(top: mediaQuery.padding.top, bottom: mediaQuery.padding.bottom),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor.withAlpha(containerAlpha),
                  borderRadius: BorderRadius.circular(containerRadius),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Center(child: SquareImageWidget(id: playbackSong.imageId, size: imageSize)),
                    const Spacer(),
                    Column(
                      children: [
                        TextWidget(text: playbackSong.name, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
                        SizedBox(height: StyleConstant.padding.tiny),
                        TextWidget(text: playbackSong.artistName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    const Spacer(),
                    const SliderWidget(),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        const PrevButtonWidget(),
                        const Spacer(),
                        PlayPauseButtonWidget(size: StyleConstant.button.large),
                        const Spacer(),
                        NextButtonWidget(size: StyleConstant.button.medium),
                        const Spacer(),
                      ],
                    ),
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
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height,
            left: 0.0,
            child: const BackButton(),
          ),
        ],
      ),
    );
  }
}
