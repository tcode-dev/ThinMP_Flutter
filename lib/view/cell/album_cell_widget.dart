import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class AlbumCellWidget extends StatelessWidget {
  final Album album;

  const AlbumCellWidget({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SquareImageWidget(id: album.imageId, size: styleConstant[StyleType.image][SizeConstant.small]),
        TextWidget(text: album.title),
        TextWidget(text: album.artist),
      ],
    );
  }
}
