import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class MediaRowWidget extends StatelessWidget {
  final SongModel song;

  const MediaRowWidget({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 51.0,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.only(top: 5, right: 10, bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onInverseSurface,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(margin: const EdgeInsets.only(right: 10), child: SquareImageWidget(id: song.imageId, size: StyleConstant.image.small)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [TextWidget(text: song.name), TextWidget(text: song.artistName)],
            ),
          ),
        ],
      ),
    );
  }
}
