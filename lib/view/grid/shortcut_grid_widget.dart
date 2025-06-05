// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/model/media/shortcut_model.dart';
import 'package:thinmpf/provider/page/shortcut_provider.dart';
import 'package:thinmpf/view/cell/shortcut_cell_view.dart';
import 'package:thinmpf/view/grid/grid_widget.dart';
import 'package:thinmpf/view/menu/album_grid_context_menu.dart';
import 'package:thinmpf/view/menu/artist_grid_context_menu.dart';
import 'package:thinmpf/view/menu/playlist_grid_context_menu.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/page/playlist_detail_page_widget.dart';

typedef ShortcutGridBuilder = Widget Function(ShortcutModel shortcut, int index, VoidCallback? callback);

final Map<ShortcutConstant, ShortcutGridBuilder> _shortcutMap = {
  ShortcutConstant.artist: (ShortcutModel shortcut, int index, VoidCallback? callback) => ArtistGridContextMenuWidget(
        artistId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => ArtistDetailPageWidget(id: shortcut.itemId), callback: callback),
      ),
  ShortcutConstant.album: (ShortcutModel shortcut, int index, VoidCallback? callback) => AlbumGridContextMenuWidget(
        albumId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => AlbumDetailPageWidget(id: shortcut.itemId), callback: callback),
      ),
  ShortcutConstant.playlist: (ShortcutModel shortcut, int index, VoidCallback? callback) => PlaylistGridContextMenuWidget(
        playlistId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => PlaylistDetailPageWidget(id: shortcut.itemId), callback: callback),
      ),
};

class ShortcutGridWidget extends ConsumerWidget {
  final VoidCallback? callback;

  const ShortcutGridWidget({super.key, this.callback});

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
