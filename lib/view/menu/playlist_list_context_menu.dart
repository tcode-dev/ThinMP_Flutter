import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class PlaylistListContextMenuWidget extends StatelessWidget {
  final String playlistId;
  final Widget child;

  const PlaylistListContextMenuWidget({super.key, required this.playlistId, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(playlistId, ShortcutItemType.playlist) ? 'remove from shortcut' : 'add to shortcut'),
        ),
      ],
      onSelected: (String value) {
        _shortcutRepository.toggleShortcut(playlistId, ShortcutItemType.playlist);
      },
      child: child,
    );
  }
}
