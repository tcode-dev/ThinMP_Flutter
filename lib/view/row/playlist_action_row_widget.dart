import 'package:flutter/material.dart';
import 'package:thinmpf/model/playlist_model.dart';
import 'package:thinmpf/view/page/playlist_detail_page_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class PlaylistActionRowWidget extends StatelessWidget {
  final PlaylistModel playlist;
  final VoidCallback? onContextMenuAction;
  final VoidCallback? onNavigateBack;

  const PlaylistActionRowWidget({
    super.key,
    required this.playlist,
    this.onContextMenuAction,
    this.onNavigateBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaylistDetailPageWidget(id: playlist.id)),
        );
        onNavigateBack?.call();
      },
      onLongPress: onContextMenuAction,
      child: ListItemRowWidget(child: PlainRowWidget(title: playlist.name)),
    );
  }
}
