import 'package:flutter/material.dart';
import 'package:thinmpf/model/artist_model.dart';
import 'package:thinmpf/view/menu/artist_list_context_menu.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class ArtistActionRowWidget extends StatelessWidget {
  final ArtistModel artist;
  final VoidCallback? onContextMenuAction;
  final VoidCallback? onNavigateBack;

  const ArtistActionRowWidget({
    super.key,
    required this.artist,
    this.onContextMenuAction,
    this.onNavigateBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtistDetailPageWidget(id: artist.id)),
        );
        onNavigateBack?.call();
      },
      child: ArtistListContextMenuWidget(
        artistId: artist.id,
        callback: onContextMenuAction,
        child: ListItemRowWidget(
          child: PlainRowWidget(title: artist.name),
        ),
      ),
    );
  }
}
