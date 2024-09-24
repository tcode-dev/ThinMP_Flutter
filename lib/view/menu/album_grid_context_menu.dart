import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

class AlbumGridContextMenuWidget extends ConsumerWidget {
  final String albumId;
  final int index;
  final Widget child;
  final VoidCallback? callback;

  const AlbumGridContextMenuWidget({
    super.key,
    required this.albumId,
    required this.index,
    required this.child,
    this.callback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(shortcutRepository.exists(albumId, ShortcutConstant.album) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
      ],
      onSelected: (String value) {
        shortcutRepository.toggleShortcut(albumId, ShortcutConstant.album);
        callback?.call();
      },
      index: index,
      child: child,
    );
  }
}
