import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/view/row/playlist_action_row_widget.dart';

class PlaylistListWidget extends ConsumerWidget {
  final VoidCallback? onContextMenuAction;
  final VoidCallback? onNavigateBack;

  const PlaylistListWidget({super.key, this.onContextMenuAction, this.onNavigateBack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlists = ref.watch(playlistsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final playlist = playlists[index];

        return PlaylistActionRowWidget(
          playlist: playlist,
          onContextMenuAction: onContextMenuAction,
          onNavigateBack: () => ref.refresh(playlistsProvider),
        );
      }, childCount: playlists.length),
    );
  }
}
