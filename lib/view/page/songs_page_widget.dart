import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/songs_provider.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class SongsPageWidget extends ConsumerWidget {
  const SongsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsyncValue = ref.watch(songsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: const Text('Songs'),
      ),
      body: Stack(
        children: [
          songsAsyncValue.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (songs) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverFixedExtentList(
                    itemExtent: 51,
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _player.startAllSongs(index);
                        },
                        child: MediaRowWidget(song: songs[index]!),
                      );
                    }, childCount: songs.length),
                  ),
                  const SliverToBoxAdapter(
                    child: EmptyRowWidget(),
                  ),
                ],
              );
            },
            error: (Object error, StackTrace stackTrace) {
              return Center(
                child: Text('Error: $error'),
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
