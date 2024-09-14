import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class PlaylistGridContextMenuWidget extends StatelessWidget {
  final String playlistId;
  final int index;
  final Widget child;

  const PlaylistGridContextMenuWidget({super.key, required this.playlistId, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(playlistId, ShortcutItemType.playlist) ? 'remove from shortcut' : 'add to shortcut'),
        ),
      ],
      onSelected: (String value) {
        _shortcutRepository.toggleShortcut(playlistId, ShortcutItemType.playlist);
      },
      index: index,
      child: child,
    );
  }
}
