import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/view/row/media_action_row_widget.dart';

class SongListWidget extends ConsumerWidget {
  final void Function(int index) onTap;
  final VoidCallback onLongPress;

  const SongListWidget({super.key, required this.onTap, required this.onLongPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return MediaActionRowWidget(
          song: songs[index],
          onTap: () => onTap(index),
          onLongPress: onLongPress,
        );
      }, childCount: songs.length),
    );
  }
}
