import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/playback_song_provider.dart';
import 'package:thinmpf/view/button/favorite_artist_button_widget.dart';
import 'package:thinmpf/view/button/favorite_song_button_widget.dart';
import 'package:thinmpf/view/button/next_button_widget.dart';
import 'package:thinmpf/view/button/play_pause_button_widget.dart';
import 'package:thinmpf/view/button/playlist_button_widget.dart';
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

    final screenSize = MediaQuery.sizeOf(context);
    final top = MediaQuery.of(context).padding.top;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
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
                        colors: <Color>[
                          Theme.of(context).scaffoldBackgroundColor,
                          const Color(0x00ffffff),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(top: top, bottom: bottom),
              child: Column(
                children: [
                  const Spacer(),
                  Center(child: ImageWidget(id: playbackSong.imageId, size: screenSize.width * 0.65)),
                  const Spacer(),
                  Column(children: [
                    Text(playbackSong.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
                    Text(playbackSong.artist, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                  ]),
                  const Spacer(),
                  const SliderWidget(),
                  const Spacer(),
                  const Row(children: [
                    Spacer(),
                    PrevButtonWidget(),
                    Spacer(),
                    PlayPauseButtonWidget(size: 100.0),
                    Spacer(),
                    NextButtonWidget(size: 75.0),
                    Spacer(),
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
