import 'package:flutter/material.dart';
import 'package:thinmpf/model/artist_model.dart';
import 'package:thinmpf/view/menu/artist_list_context_menu.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class ArtistActionRowWidget extends StatelessWidget {
  final ArtistModel artist;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ArtistActionRowWidget({
    super.key,
    required this.artist,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ArtistListContextMenuWidget(
        artistId: artist.id,
        callback: onLongPress,
        child: ListItemRowWidget(
          child: PlainRowWidget(title: artist.name),
        ),
      ),
    );
  }
}
