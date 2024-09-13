import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class AlbumContextMenuWidget extends StatelessWidget {
  final String albumId;
  final Widget child;

  const AlbumContextMenuWidget({super.key, required this.albumId, required this.child});

  @override
  Widget build(BuildContext context) {
    return ContextMenuWidget(
      items: [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(albumId, ShortcutItemType.album) ? 'add to shortcut' : 'remove from shortcut'),
        ),
      ],
      onSelected: (String value) {
        if (_shortcutRepository.exists(albumId, ShortcutItemType.album)) {
          _shortcutRepository.delete(albumId, ShortcutItemType.album);
        } else {
          _shortcutRepository.add(albumId, ShortcutItemType.album);
        }
      },
      child: child,
    );
  }
}
