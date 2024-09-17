import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/shortcut_model.dart';
import 'package:thinmpf/provider/page/main_provider.dart';
import 'package:thinmpf/util/calc_grid_aspect_ratio.dart';
import 'package:thinmpf/util/calc_grid_count.dart';
import 'package:thinmpf/view/cell/shortcut_cell_view.dart';
import 'package:thinmpf/view/menu/album_grid_context_menu.dart';
import 'package:thinmpf/view/menu/artist_grid_context_menu.dart';
import 'package:thinmpf/view/menu/playlist_grid_context_menu.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/page/playlist_detail_page_widget.dart';

final _shortcutMap = {
  ShortcutConstant.artist: (ShortcutModel shortcut, int index, Function() callback) => ArtistGridContextMenuWidget(
        artistId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => ArtistDetailPageWidget(id: shortcut.itemId), onTap: callback),
      ),
  ShortcutConstant.album: (ShortcutModel shortcut, int index, Function() callback) => AlbumGridContextMenuWidget(
        albumId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => AlbumDetailPageWidget(id: shortcut.itemId), onTap: callback),
      ),
  ShortcutConstant.playlist: (ShortcutModel shortcut, int index, Function() callback) => PlaylistGridContextMenuWidget(
        playlistId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => PlaylistDetailPageWidget(id: shortcut.itemId), onTap: callback),
      ),
};

class ShortcutGridWidget extends ConsumerStatefulWidget {
  const ShortcutGridWidget({super.key});

  @override
  ShortcutGridWidgetState createState() => ShortcutGridWidgetState();
}

class ShortcutGridWidgetState extends ConsumerState<ShortcutGridWidget> {
  void _reload() {
    ref.read(mainProvider.notifier).reload();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(mainProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final gridCount = calcGridCount(screenSize.width);
    final gridAspectRatio = calcGridAspectRatio(screenSize.width, gridCount);

    return asyncValue.when(
      loading: () => Container(),
      error: (Object error, StackTrace stackTrace) {
        return ErrorWidget(error);
      },
      data: (vm) {
        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: gridAspectRatio,
            crossAxisCount: gridCount,
            crossAxisSpacing: StyleConstant.padding.large,
            mainAxisSpacing: StyleConstant.padding.large,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final shortcut = vm.shortcuts[index];

              return _shortcutMap[shortcut.type]!(shortcut, index, _reload);
            },
            childCount: vm.shortcuts.length,
          ),
        );
      },
    );
  }
}
