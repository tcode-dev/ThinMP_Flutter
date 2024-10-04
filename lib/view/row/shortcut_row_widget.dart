import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/media/shortcut_model.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class ShortcutRowWidget extends StatelessWidget {
  final ShortcutModel shortcut;

  const ShortcutRowWidget({
    super.key,
    required this.shortcut,
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
          Container(
            margin: EdgeInsets.only(right: StyleConstant.padding.small),
            child: shortcut.type == ShortcutConstant.artist ? CircleImageWidget(id: shortcut.imageId, size: StyleConstant.image.tiny) : SquareImageWidget(id: shortcut.imageId, size: StyleConstant.image.tiny),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: shortcut.name),
                TextWidget(text: shortcut.dedcription, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
