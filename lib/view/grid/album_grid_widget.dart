// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/grid/grid_widget.dart';
import 'package:thinmpf/view/menu/album_grid_context_menu.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';

class AlbumGridWidget extends ConsumerWidget {
  final VoidCallback? callback;

  const AlbumGridWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(albumsProvider);

    return GridWidget(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final album = albums[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlbumDetailPageWidget(id: album.id)),
              );
              callback?.call();
            },
            child: AlbumGridContextMenuWidget(
              albumId: album.id,
              index: index,
              callback: callback,
              child: AlbumCellWidget(album: albums[index]),
            ),
          );
        },
        childCount: albums.length,
      ),
    );
  }
}
