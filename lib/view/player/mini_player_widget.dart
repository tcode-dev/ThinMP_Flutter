import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/playback_provider.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class MiniPlayerWidget extends ConsumerWidget {
  const MiniPlayerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackState = ref.watch(playbackProvider);
    final song = playbackState.song!;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.only(top: 5, right: 10, bottom: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x1F000000),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(width: 40, height: 40, margin: const EdgeInsets.only(right: 10), child: ImageWidget(id: song.imageId, size: 40)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.title, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
