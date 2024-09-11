import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/context_menu.dart';

class PlaylistContextMenuWidget extends StatelessWidget {
  final String playlistId;
  final Widget child;

  const PlaylistContextMenuWidget({super.key, required this.playlistId, required this.child});

  @override
  Widget build(BuildContext context) {
    return ContextMenuWidget(
      items: const [
        PopupMenuItem(
          value: 'shortcut',
          child: Text('add to shortcut'),
        ),
      ],
      onSelected: (String value) {
        final shortcutRepository = ShortcutRepository();

        shortcutRepository.add(playlistId, ShortcutItemType.playlist);
      },
      child: child,
    );
  }
}
