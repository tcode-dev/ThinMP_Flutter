import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/page/artist_detail_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/util/calc_child_aspect_ratio.dart';
import 'package:thinmpf/util/calc_cross_axis_count.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class ArtistDetailPageWidget extends ConsumerWidget {
  final String id;

  const ArtistDetailPageWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(artistDetailProvider(id));
    final screenSize = MediaQuery.sizeOf(context);
    final crossAxisCount = calcCrossAxisCount(screenSize.width);
    final childAspectRatio = calcChildAspectRatio(screenSize.width, crossAxisCount);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          asyncValue.when(
            loading: () => const LoadingWidget(),
            error: (Object error, StackTrace stackTrace) {
              return ErrorWidget(error);
            },
            data: (vm) {
              if (vm == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop();
                });
                return const LoadingWidget();
              }
              return CustomScrollView(slivers: [
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
                          child: Blur(
                            blur: 10,
                            blurColor: Theme.of(context).transparent,
                            child: ImageWidget(id: vm.imageId, size: screenSize.width),
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
                        Positioned(
                          child: Center(child: CircleImageWidget(id: vm.imageId, size: screenSize.width * 0.33)),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                    child: Center(
                      child: Text(vm.description),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
                    child: Text("Albums", style: Theme.of(context).textTheme.headlineMedium),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(StyleConstant.padding.large),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: childAspectRatio,
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: StyleConstant.padding.large,
                      mainAxisSpacing: StyleConstant.padding.large,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final album = vm.albums[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AlbumDetailPageWidget(id: album.id)),
                            );
                          },
                          child: AlbumCellWidget(album: vm.albums[index]),
                        );
                      },
                      childCount: vm.albums.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(bottom: StyleConstant.padding.small, left: StyleConstant.padding.large),
                    child: Text("Songs", style: Theme.of(context).textTheme.headlineMedium),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: StyleConstant.row.borderBoxHeight,
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _player.startArtistSongs(index, id);
                      },
                      child: MediaRowWidget(song: vm.songs[index]),
                    );
                  }, childCount: vm.songs.length),
                ),
                const SliverToBoxAdapter(
                  child: EmptyRowWidget(),
                ),
              ]);
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
