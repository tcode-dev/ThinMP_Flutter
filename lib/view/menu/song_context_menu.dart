import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';
import 'package:thinmpf/view/playlist/playlist_dialog_widget.dart';
import 'package:thinmpf/view/text/favorite_song_text_widget.dart';
import 'package:thinmpf/view/text/playlist_text_widget.dart';

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
          value: favoriteLabel,
          child: FavoriteSongTextWidget(songId: songId),
        ),
        const PopupMenuItem(
          value: playlistLabel,
          child: PlaylistTextWidget(),
        ),
      ],
      onSelected: (String value) async {
        if (value == favoriteLabel) {
          favoriteSongRepository.toggle(songId);
        } else if (value == playlistLabel) {
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
