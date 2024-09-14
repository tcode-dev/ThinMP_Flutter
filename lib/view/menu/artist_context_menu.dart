import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class ArtistContextMenuWidget extends StatelessWidget {
  final String artistId;
  final Widget child;

  const ArtistContextMenuWidget({super.key, required this.artistId, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListContextMenuWidget(
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
          if (_shortcutRepository.exists(artistId, ShortcutItemType.artist)) {
            _shortcutRepository.delete(artistId, ShortcutItemType.artist);
          } else {
            _shortcutRepository.add(artistId, ShortcutItemType.artist);
          }
        } else if (value == 'favorite') {
          final repository = FavoriteArtistRepository();

          repository.add(artistId);
        }
      },
      child: child,
    );
  }
}
