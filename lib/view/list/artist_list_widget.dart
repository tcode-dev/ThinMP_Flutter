import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/artists_provider.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/row/artist_action_row_widget.dart';

class ArtistListWidget extends ConsumerWidget {
  final VoidCallback onLongPress;

  const ArtistListWidget({super.key, required this.onLongPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(artistsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final artist = artists[index];
        return ArtistActionRowWidget(
          artist: artist,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArtistDetailPageWidget(id: artist.id)),
            );
          },
          onLongPress: onLongPress,
        );
      }, childCount: artists.length),
    );
  }
}
