import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/album_detail_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class AlbumDetailPageWidget extends ConsumerWidget {
  final String id;

  const AlbumDetailPageWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(albumDetailProvider(id));
    final screenSize = MediaQuery.sizeOf(context);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          asyncValue.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (Object error, StackTrace stackTrace) {
              return ErrorWidget(error);
            },
            data: (vm) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: screenSize.width - top,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(vm.name),
                      background: Stack(
                        children: [
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: ImageWidget(id: vm.imageId, size: screenSize.width),
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
                                    Theme.of(context).transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                      child: Center(
                        child: Text(vm.artistName),
                      ),
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 51,
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _player.startAlbumSongs(index, id);
                        },
                        child: MediaRowWidget(song: vm.songs[index]),
                      );
                    }, childCount: vm.songs.length),
                  ),
                  const SliverToBoxAdapter(
                    child: EmptyRowWidget(),
                  ),
                ],
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
