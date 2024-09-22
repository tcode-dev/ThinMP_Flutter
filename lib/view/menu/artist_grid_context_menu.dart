import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class ArtistGridContextMenuWidget extends ConsumerWidget {
  final String artistId;
  final int index;
  final VoidCallback? callback;
  final Widget child;

  const ArtistGridContextMenuWidget({super.key, required this.artistId, required this.index, required this.callback, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArtistRepository = ref.read(favoriteArtistRepositoryFactoryProvider);

    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(artistId, ShortcutConstant.artist) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
        PopupMenuItem(
          value: 'favorite',
          child: Text(favoriteArtistRepository.exists(artistId) ? AppLocalizations.of(context)!.favoriteRemove : AppLocalizations.of(context)!.favoriteAdd),
        ),
      ],
      onSelected: (String value) {
        if (value == 'shortcut') {
          _shortcutRepository.toggleShortcut(artistId, ShortcutConstant.artist);
        } else if (value == 'favorite') {
          favoriteArtistRepository.toggle(artistId);
        }
        callback?.call();
      },
      index: index,
      child: child,
    );
  }
}
