import 'package:flutter/material.dart';
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
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SquareImageWidget(id: album.imageId, size: width),
          ),
          TextWidget(text: album.title, textAlign: TextAlign.center),
          TextWidget(text: album.artist, textAlign: TextAlign.center),
        ],
      );
    });
  }
}
