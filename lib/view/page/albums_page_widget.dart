import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/albums_provider.dart';
import 'package:thinmpf/util/calc_child_aspect_ratio.dart';
import 'package:thinmpf/util/calc_cross_axis_count.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class AlbumsPageWidget extends ConsumerWidget {
  const AlbumsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(albumsProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final crossAxisCount = calcCrossAxisCount(screenSize.width);
    final childAspectRatio = calcChildAspectRatio(screenSize.width, crossAxisCount);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: const Text('Albums'),
      ),
      body: Stack(
        children: [
          asyncValue.when(
            loading: () => const LoadingWidget(),
            error: (Object error, StackTrace stackTrace) {
              return ErrorWidget(error);
            },
            data: (vm) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.all(styleConstant[StyleType.padding][SizeConstant.large]),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: childAspectRatio,
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
                        mainAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
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
                            child: AlbumCellWidget(album: album),
                          );
                        },
                        childCount: vm.albums.length,
                      ),
                    ),
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
