import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/view/page/playlist_detail_page_widget.dart';
import 'package:thinmpf/view/row/playlist_action_row_widget.dart';

class PlaylistListWidget extends ConsumerWidget {
  final VoidCallback onLongPress;

  const PlaylistListWidget({super.key, required this.onLongPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlists = ref.watch(playlistsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final playlist = playlists[index];

        return GestureDetector(
          child: PlaylistActionRowWidget(
            playlist: playlist,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlaylistDetailPageWidget(id: playlist.id)),
              );
            },
            onLongPress: onLongPress,
          ),
        );
      }, childCount: playlists.length),
    );
  }
}
