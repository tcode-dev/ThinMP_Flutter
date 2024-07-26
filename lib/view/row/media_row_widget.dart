import 'package:flutter/material.dart';
import 'package:thinmpf/pigeon_output/song.g.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class MediaRowWidget extends StatelessWidget {
  final Song song;

  const MediaRowWidget({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
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
              children: [Text(song.title, overflow: TextOverflow.ellipsis), Text(song.artist, overflow: TextOverflow.ellipsis)],
            ),
          ),
        ],
      ),
    );
  }
}
