import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class PlaylistGridContextMenuWidget extends StatelessWidget {
  final String playlistId;
  final int index;
  final Function() callback;
  final Widget child;

  const PlaylistGridContextMenuWidget({super.key, required this.playlistId, required this.index, required this.callback, required this.child});

  @override
  Widget build(BuildContext context) {
    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(playlistId, ShortcutConstant.playlist) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
      ],
      onSelected: (String value) {
        _shortcutRepository.toggleShortcut(playlistId, ShortcutConstant.playlist);
        callback();
      },
      index: index,
      child: child,
    );
  }
}
