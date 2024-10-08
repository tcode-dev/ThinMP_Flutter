import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';

class PlaylistGridContextMenuWidget extends ConsumerWidget {
  final String playlistId;
  final int index;
  final VoidCallback? callback;
  final Widget child;

  const PlaylistGridContextMenuWidget({super.key, required this.playlistId, required this.index, this.callback, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return GridContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: shortcutLabel,
          child: ShortcutTextWidget(id: playlistId, type: ShortcutConstant.playlist),
        ),
      ],
      onSelected: (String value) {
        shortcutRepository.toggle(playlistId, ShortcutConstant.playlist);
        callback?.call();
      },
      index: index,
      child: child,
    );
  }
}
