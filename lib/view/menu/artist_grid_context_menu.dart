import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

class ArtistGridContextMenuWidget extends ConsumerWidget {
  final String artistId;
  final int index;
  final VoidCallback? callback;
  final Widget child;

  const ArtistGridContextMenuWidget({super.key, required this.artistId, required this.index, this.callback, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(shortcutRepository.exists(artistId, ShortcutConstant.artist) ? localizations.shortcutRemove : localizations.shortcutAdd),
        ),
        PopupMenuItem(
          value: 'favorite',
          child: Text(favoriteArtistRepository.exists(artistId) ? localizations.favoriteRemove : localizations.favoriteAdd),
        ),
      ],
      onSelected: (String value) {
        if (value == 'shortcut') {
          shortcutRepository.toggle(artistId, ShortcutConstant.artist);
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
