import 'package:flutter/material.dart';
import 'package:thinmpf/model/media/playlist_model.dart';
import 'package:thinmpf/view/page/playlist_detail_page_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class PlaylistActionRowWidget extends StatelessWidget {
  final PlaylistModel playlist;
  final VoidCallback? callback;

  const PlaylistActionRowWidget({
    super.key,
    required this.playlist,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaylistDetailPageWidget(id: playlist.id)),
        );
        callback?.call();
      },
      onLongPress: callback,
      child: ListItemRowWidget(child: PlainRowWidget(title: playlist.name)),
    );
  }
}
