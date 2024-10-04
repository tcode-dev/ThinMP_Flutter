import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/media/album_model.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class AlbumCellWidget extends StatelessWidget {
  final AlbumModel album;

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
              height: StyleConstant.row.contentBoxHeight,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(text: album.name, textAlign: TextAlign.center),
                    TextWidget(text: album.artistName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
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
