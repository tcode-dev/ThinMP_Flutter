import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/page/main_provider.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/grid/grid_widget.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';

class AlbumsGridWidget extends ConsumerStatefulWidget {
  const AlbumsGridWidget({super.key});

  @override
  ShortcutGridWidgetState createState() => ShortcutGridWidgetState();
}

class ShortcutGridWidgetState extends ConsumerState<AlbumsGridWidget> {
  void _reload() {
    ref.read(mainProvider.notifier).reload();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(mainProvider);

    return asyncValue.when(
        loading: () => Container(),
        error: (Object error, StackTrace stackTrace) {
          return ErrorWidget(error);
        },
        data: (vm) {
          return GridWidget(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final album = vm.albums[index];

              return GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlbumDetailPageWidget(id: album!.id)),
                  );
                  _reload();
                },
                child: AlbumCellWidget(album: vm.albums[index]),
              );
            },
            childCount: vm.albums.length,
          ));
        });
  }
}
