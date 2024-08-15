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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SquareImageWidget(id: album.imageId, size: constraints.maxWidth),
            SizedBox(
              height: styleConstant[StyleType.height][SizeConstant.small],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(text: album.name, textAlign: TextAlign.center),
                    TextWidget(text: album.artistName, textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
