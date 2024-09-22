import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';
import 'package:thinmpf/view/playlist/playlist_dialog_widget.dart';

class SongContextMenuWidget extends ConsumerWidget {
  final String songId;
  final VoidCallback? callback;
  final Widget child;

  const SongContextMenuWidget({super.key, required this.child, this.callback, required this.songId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);

    return ListContextMenuWidget(
      widgetBuilder: () => [
        PopupMenuItem(
          value: 'favorite',
          child: Text(favoriteSongRepository.exists(songId) ? AppLocalizations.of(context)!.favoriteRemove : AppLocalizations.of(context)!.favoriteAdd),
        ),
        PopupMenuItem(
          value: 'playlist',
          child: Text(AppLocalizations.of(context)!.playlistAdd),
        ),
      ],
      onSelected: (String value) async {
        if (value == 'favorite') {
          favoriteSongRepository.toggle(songId);
        } else if (value == 'playlist') {
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return PlaylistDialogWidget(songId: songId);
            },
          );
        }

        callback?.call();
      },
      child: child,
    );
  }
}
