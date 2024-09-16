import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class PlaylistListContextMenuWidget extends StatelessWidget {
  final String playlistId;
  final Function() callback;
  final Widget child;

  const PlaylistListContextMenuWidget({super.key, required this.playlistId, required this.callback, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(playlistId, ShortcutItemType.playlist) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
      ],
      onSelected: (String value) {
        _shortcutRepository.toggleShortcut(playlistId, ShortcutItemType.playlist);
        callback();
      },
      child: child,
    );
  }
}
