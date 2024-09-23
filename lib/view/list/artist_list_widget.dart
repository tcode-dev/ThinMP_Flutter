import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/artists_provider.dart';
import 'package:thinmpf/view/row/artist_action_row_widget.dart';

class ArtistListWidget extends ConsumerWidget {
  final VoidCallback onContextMenuAction;
  final VoidCallback onNavigateBack;

  const ArtistListWidget({super.key, required this.onContextMenuAction, required this.onNavigateBack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(artistsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ArtistActionRowWidget(
          artist: artists[index],
          onContextMenuAction: onContextMenuAction,
          onNavigateBack: onNavigateBack,
        );
      }, childCount: artists.length),
    );
  }
}
