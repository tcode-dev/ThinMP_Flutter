import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

class PlaylistGridContextMenuWidget extends ConsumerWidget {
  final String playlistId;
  final int index;
  final Function() callback;
  final Widget child;

  const PlaylistGridContextMenuWidget({super.key, required this.playlistId, required this.index, required this.callback, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(shortcutRepository.exists(playlistId, ShortcutConstant.playlist) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
      ],
      onSelected: (String value) {
        shortcutRepository.toggleShortcut(playlistId, ShortcutConstant.playlist);
        callback();
      },
      index: index,
      child: child,
    );
  }
}
