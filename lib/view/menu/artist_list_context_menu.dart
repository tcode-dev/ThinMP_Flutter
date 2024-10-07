import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';

class ArtistListContextMenuWidget extends ConsumerWidget {
  final String artistId;
  final VoidCallback? callback;
  final Widget child;

  const ArtistListContextMenuWidget({super.key, required this.artistId, required this.child, this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return ListContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: shortcutLabel,
          child: Text(shortcutRepository.exists(artistId, ShortcutConstant.artist) ? localizations.shortcutRemove : localizations.shortcutAdd),
        ),
        PopupMenuItem(
          value: favoriteLabel,
          child: Text(favoriteArtistRepository.exists(artistId) ? localizations.favoriteRemove : localizations.favoriteAdd),
        ),
      ],
      onSelected: (String value) {
        if (value == shortcutLabel) {
          shortcutRepository.toggle(artistId, ShortcutConstant.artist);
        } else if (value == favoriteLabel) {
          favoriteArtistRepository.toggle(artistId);
        }
        callback?.call();
      },
      child: child,
    );
  }
}
