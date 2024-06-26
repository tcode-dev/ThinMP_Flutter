import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/songs_provider.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';

class SongsPageView extends ConsumerWidget {
  const SongsPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider).value ?? [];

    return Scaffold(
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final player = HostPlayerApi();

              player.startBySongs(index);
            },
            child: Column(
              children: [
                Text(songs[index]!.title),
                Text(songs[index]!.artist),
                const Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
