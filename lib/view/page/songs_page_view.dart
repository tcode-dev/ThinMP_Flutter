import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';
import 'package:thinmpf/provider/songs_provider.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

class SongsPageView extends ConsumerWidget {
  final PlayerHostApi player = PlayerHostApi();

  SongsPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider).value ?? [];

    return Scaffold(
      body: ListView.builder(
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
    );
  }
}
