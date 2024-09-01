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
      height: StyleConstant.row.borderBoxHeight,
      margin: EdgeInsets.only(left: StyleConstant.padding.small),
      padding: EdgeInsets.only(top: StyleConstant.padding.tiny, right: StyleConstant.padding.small, bottom: StyleConstant.padding.tiny),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onInverseSurface,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(margin: EdgeInsets.only(right: StyleConstant.padding.small), child: SquareImageWidget(id: song.imageId, size: StyleConstant.image.tiny)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: song.name),
                TextWidget(text: song.artistName, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
