import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class ArtistGridContextMenuWidget extends StatelessWidget {
  final String artistId;
  final int index;
  final Widget child;

  const ArtistGridContextMenuWidget({super.key, required this.artistId, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(artistId, ShortcutItemType.artist) ? 'remove from shortcut' : 'add to shortcut'),
        ),
        const PopupMenuItem(
          value: 'favorite',
          child: Text('add to favorites'),
        ),
      ],
      onSelected: (String value) {
        if (value == 'shortcut') {
          _shortcutRepository.toggleShortcut(artistId, ShortcutItemType.artist);
        } else if (value == 'favorite') {
          final repository = FavoriteArtistRepository();

          repository.add(artistId);
        }
      },
      index: index,
      child: child,
    );
  }
}
