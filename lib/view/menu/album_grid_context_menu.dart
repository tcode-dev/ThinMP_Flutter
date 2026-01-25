// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/grid_context_menu.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';

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
          value: shortcutLabel,
          child: ShortcutTextWidget(id: albumId, type: ShortcutConstant.album),
        ),
      ],
      onSelected: (String value) async {
        await shortcutRepository.toggle(albumId, ShortcutConstant.album);
        callback?.call();
      },
      index: index,
      child: child,
    );
  }
}
