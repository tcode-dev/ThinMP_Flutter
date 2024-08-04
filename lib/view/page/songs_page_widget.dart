import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/songs_provider.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

class SongsPageWidget extends ConsumerWidget {
  final PlayerHostApi player = PlayerHostApi();

  SongsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider).value ?? [];

    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index]!;

              return GestureDetector(
                onTap: () {
                  player.startBySongs(index);
                },
                child: MediaRowWidget(song: song),
              );
            },
          ),
          const Positioned(
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: MiniPlayerWidget(),
          ),
        ],
      ),
    );
  }
}
