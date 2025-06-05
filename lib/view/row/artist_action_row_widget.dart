// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:thinmpf/model/media/artist_model.dart';
import 'package:thinmpf/view/menu/artist_list_context_menu.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class ArtistActionRowWidget extends StatelessWidget {
  final ArtistModel artist;
  final VoidCallback? callback;

  const ArtistActionRowWidget({
    super.key,
    required this.artist,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtistDetailPageWidget(id: artist.id)),
        );
        callback?.call();
      },
      child: ArtistListContextMenuWidget(
        artistId: artist.id,
        callback: callback,
        child: ListItemRowWidget(
          child: PlainRowWidget(title: artist.name),
        ),
      ),
    );
  }
}
