import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/media/song_model.dart';
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
      height: StyleConstant.row.contentBoxHeight,
      padding: EdgeInsets.only(right: StyleConstant.padding.small),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(margin: EdgeInsets.only(right: StyleConstant.padding.small), child: SquareImageWidget(id: song.imageId, size: StyleConstant.image.tiny)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
