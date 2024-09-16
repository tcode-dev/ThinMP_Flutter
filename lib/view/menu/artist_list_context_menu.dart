import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';

final _shortcutRepository = ShortcutRepository();
final _favoriteArtistRepository = FavoriteArtistRepository();

class ArtistListContextMenuWidget extends StatelessWidget {
  final String artistId;
  final VoidCallback? callback;
  final Widget child;

  const ArtistListContextMenuWidget({super.key, required this.artistId, required this.child, this.callback});

  @override
  Widget build(BuildContext context) {
    return ListContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(artistId, ShortcutItemType.artist) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
        PopupMenuItem(
          value: 'favorite',
          child: Text(_favoriteArtistRepository.exists(artistId) ? AppLocalizations.of(context)!.favoriteRemove : AppLocalizations.of(context)!.favoriteAdd),
        ),
      ],
      onSelected: (String value) {
        if (value == 'shortcut') {
          _shortcutRepository.toggleShortcut(artistId, ShortcutItemType.artist);
        } else if (value == 'favorite') {
          _favoriteArtistRepository.toggle(artistId);
        }
        callback?.call();
      },
      child: child,
    );
  }
}
