import 'package:flutter/material.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/view/menu/song_context_menu.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

class MediaActionRowWidget extends StatelessWidget {
  final SongModel song;
  final Function() onTap;
  final Function() onLongPress;

  const MediaActionRowWidget({
    super.key,
    required this.song,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListItemRowWidget(
        child: SongContextMenuWidget(
          callback: onLongPress,
          child: MediaRowWidget(song: song),
        ),
      ),
    );
  }
}