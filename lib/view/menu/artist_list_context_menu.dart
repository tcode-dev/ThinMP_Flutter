// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';
import 'package:thinmpf/view/text/favorite_artist_text_widget.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';

class ArtistListContextMenuWidget extends ConsumerWidget {
  final String artistId;
  final VoidCallback? callback;
  final Widget child;

  const ArtistListContextMenuWidget({super.key, required this.artistId, required this.child, this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return ListContextMenuWidget(
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
      onSelected: (String value) async {
        if (value == shortcutLabel) {
          await shortcutRepository.toggle(artistId, ShortcutConstant.artist);
        } else if (value == favoriteLabel) {
          await favoriteArtistRepository.toggle(artistId);
        }
        callback?.call();
      },
      child: child,
    );
  }
}
