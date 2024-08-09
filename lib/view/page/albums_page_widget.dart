import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/albums_provider.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';

class AlbumsPageWidget extends ConsumerWidget {
  final PlayerHostApi player = PlayerHostApi();

  AlbumsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(albumsProvider).value ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: const Text('albums'),
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index]!;

              return GestureDetector(
                onTap: () {
                  // player.startAllSongs(index);
                },
                child: AlbumCellWidget(album: album),
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
