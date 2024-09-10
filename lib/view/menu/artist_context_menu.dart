import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/context_menu.dart';

class ArtistContextMenuWidget extends StatelessWidget {
  final String artistId;
  final Widget child;

  const ArtistContextMenuWidget({super.key, required this.artistId, required this.child});

  @override
  Widget build(BuildContext context) {
    return ContextMenuWidget(
      items: const [
        PopupMenuItem(
          value: 'shortcut',
          child: Text('add to shortcut'),
        ),
        PopupMenuItem(
          value: 'favorite',
          child: Text('add to favorites'),
        ),
      ],
      onSelected: (String value) {
        if (value == 'shortcut') {
          final shortcutRepository = ShortcutRepository();

          shortcutRepository.add(artistId, ShortcutItemType.artist);
        } else if (value == 'favorite') {
          final repository = FavoriteArtistRepository();

          repository.add(artistId);
        }
      },
      child: child,
    );
  }
}
