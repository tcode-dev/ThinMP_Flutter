// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';

class PlaylistListContextMenuWidget extends ConsumerWidget {
  final String playlistId;
  final VoidCallback? callback;
  final Widget child;

  const PlaylistListContextMenuWidget({super.key, required this.playlistId, required this.callback, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return ListContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: shortcutLabel,
          child: ShortcutTextWidget(id: playlistId, type: ShortcutConstant.playlist),
        ),
      ],
      onSelected: (String value) async {
        await shortcutRepository.toggle(playlistId, ShortcutConstant.playlist);
        callback?.call();
      },
      child: child,
    );
  }
}
