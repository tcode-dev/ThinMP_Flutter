// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/view/row/playlist_action_row_widget.dart';

class PlaylistListWidget extends ConsumerWidget {
  final VoidCallback? callback;

  const PlaylistListWidget({super.key, this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlists = ref.watch(playlistsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return PlaylistActionRowWidget(
          playlist: playlists[index],
          callback: callback,
        );
      }, childCount: playlists.length),
    );
  }
}
