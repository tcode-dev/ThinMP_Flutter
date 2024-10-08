import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';
import 'package:thinmpf/view/text/favorite_artist_text_widget.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';

class ArtistGridContextMenuWidget extends ConsumerWidget {
  final String artistId;
  final int index;
  final VoidCallback? callback;
  final Widget child;

  const ArtistGridContextMenuWidget({super.key, required this.artistId, required this.index, this.callback, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: shortcutLabel,
          child: ShortcutTextWidget(id: artistId, type: ShortcutConstant.artist),
        ),
        PopupMenuItem(
          value: favoriteLabel,
          child: FavoriteArtistTextWidget(artistId: artistId),
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
      index: index,
      child: child,
    );
  }
}
