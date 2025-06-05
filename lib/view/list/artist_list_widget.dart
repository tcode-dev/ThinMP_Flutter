// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/artists_provider.dart';
import 'package:thinmpf/view/row/artist_action_row_widget.dart';

class ArtistListWidget extends ConsumerWidget {
  final VoidCallback? callback;

  const ArtistListWidget({super.key, this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(artistsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ArtistActionRowWidget(
          artist: artists[index],
          callback: callback,
        );
      }, childCount: artists.length),
    );
  }
}
