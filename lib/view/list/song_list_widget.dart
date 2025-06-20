// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/view/row/media_action_row_widget.dart';

class SongListWidget extends ConsumerWidget {
  final void Function(int index) onTap;
  final VoidCallback? callback;

  const SongListWidget({super.key, required this.onTap, this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return MediaActionRowWidget(
          song: songs[index],
          onTap: () => onTap(index),
          callback: callback,
        );
      }, childCount: songs.length),
    );
  }
}
