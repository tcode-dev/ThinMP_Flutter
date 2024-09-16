import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';

final _shortcutRepository = ShortcutRepository();

class AlbumGridContextMenuWidget extends StatelessWidget {
  final String albumId;
  final int index;
  final Function() callback;
  final Widget child;

  const AlbumGridContextMenuWidget({super.key, required this.albumId, required this.index, required this.callback, required this.child});

  @override
  Widget build(BuildContext context) {
    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'shortcut',
          child: Text(_shortcutRepository.exists(albumId, ShortcutItemType.album) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd),
        ),
      ],
      onSelected: (String value) {
        _shortcutRepository.toggleShortcut(albumId, ShortcutItemType.album);
        callback();
      },
      index: index,
      child: child,
    );
  }
}
