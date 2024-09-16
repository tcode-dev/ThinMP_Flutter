import 'package:flutter/material.dart';
import 'package:thinmpf/model/playlist_model.dart';
import 'package:thinmpf/view/menu/playlist_list_context_menu.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class PlaylistActionRowWidget extends StatelessWidget {
  final PlaylistModel playlist;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const PlaylistActionRowWidget({
    super.key,
    required this.playlist,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PlaylistListContextMenuWidget(
        playlistId: playlist.id,
        callback: () => {},
        child: ListItemRowWidget(
          child: PlainRowWidget(title: playlist.name),
        ),
      ),
    );
  }
}
