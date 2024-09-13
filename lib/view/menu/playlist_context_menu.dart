import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class PlaylistContextMenuWidget extends StatelessWidget {
  final String playlistId;
  final Widget child;

  const PlaylistContextMenuWidget({super.key, required this.playlistId, required this.child});

  @override
  Widget build(BuildContext context) {
    return ContextMenuWidget(
      items: [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(playlistId, ShortcutItemType.playlist) ? 'remove from shortcut' : 'add to shortcut'),
        ),
      ],
      onSelected: (String value) {
        if (_shortcutRepository.exists(playlistId, ShortcutItemType.playlist)) {
          _shortcutRepository.delete(playlistId, ShortcutItemType.playlist);
        } else {
          _shortcutRepository.add(playlistId, ShortcutItemType.playlist);
        }
      },
      child: child,
    );
  }
}
