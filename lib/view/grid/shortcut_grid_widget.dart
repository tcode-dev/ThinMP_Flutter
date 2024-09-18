import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/model/shortcut_model.dart';
import 'package:thinmpf/provider/page/shortcut_provider.dart';
import 'package:thinmpf/view/cell/shortcut_cell_view.dart';
import 'package:thinmpf/view/grid/grid_widget.dart';
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

class ShortcutGridWidget extends ConsumerWidget {
  final VoidCallback callback;

  const ShortcutGridWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortcuts = ref.watch(shortcutProvider);

    return GridWidget(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final shortcut = shortcuts[index];

          return _shortcutMap[shortcut.type]!(shortcut, index, callback);
        },
        childCount: shortcuts.length,
      ),
    );
  }
}
