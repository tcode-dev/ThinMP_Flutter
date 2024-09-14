import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class AlbumGridContextMenuWidget extends StatelessWidget {
  final String albumId;
  final int index;
  final Widget child;

  const AlbumGridContextMenuWidget({super.key, required this.albumId, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(value: 'shortcut', child: Text(_shortcutRepository.exists(albumId, ShortcutItemType.album) ? 'remove from shortcut' : 'add to shortcut')),
      ],
      onSelected: (String value) {
        _shortcutRepository.toggleShortcut(albumId, ShortcutItemType.album);
      },
      index: index,
      child: child,
    );
  }
}
