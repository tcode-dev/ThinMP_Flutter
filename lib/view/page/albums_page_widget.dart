import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/albums_provider.dart';
import 'package:thinmpf/util/calc_child_aspect_ratio.dart';
import 'package:thinmpf/util/calc_cross_axis_count.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';

class AlbumsPageWidget extends ConsumerWidget {
  const AlbumsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(albumsProvider).value ?? [];
    final screenSize = MediaQuery.sizeOf(context);
    final crossAxisCount = calcCrossAxisCount(screenSize.width);
    final childAspectRatio = calcChildAspectRatio(screenSize.width, crossAxisCount);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: const Text('albums'),
      ),
      body: Stack(
        children: [
          GridView.builder(
            padding: EdgeInsets.all(styleConstant[StyleType.padding][SizeConstant.large]),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
              mainAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
              childAspectRatio: childAspectRatio,
              crossAxisCount: crossAxisCount,
            ),
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index]!;

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
