import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

final _shortcutRepository = ShortcutRepository();
final _favoriteArtistRepository = FavoriteArtistRepository();

class ArtistGridContextMenuWidget extends StatelessWidget {
  final String artistId;
  final int index;
  final VoidCallback? callback;
  final Widget child;

  const ArtistGridContextMenuWidget({super.key, required this.artistId, required this.index, required this.callback, required this.child});

  @override
  Widget build(BuildContext context) {
    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(artistId, ShortcutConstant.artist) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
        PopupMenuItem(
          value: 'favorite',
          child: Text(_favoriteArtistRepository.exists(artistId) ? AppLocalizations.of(context)!.favoriteRemove : AppLocalizations.of(context)!.favoriteAdd),
        ),
      ],
      onSelected: (String value) {
        if (value == 'shortcut') {
          _shortcutRepository.toggleShortcut(artistId, ShortcutConstant.artist);
        } else if (value == 'favorite') {
          _favoriteArtistRepository.toggle(artistId);
        }
        callback?.call();
      },
      index: index,
      child: child,
    );
  }
}
