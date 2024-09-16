import 'package:flutter/material.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/shortcut_model.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class ShortcutCellWidget extends StatelessWidget {
  final ShortcutModel shortcut;
  final Widget Function() widgetBuilder;
  final void Function() onTap;

  const ShortcutCellWidget({
    super.key,
    required this.shortcut,
    required this.widgetBuilder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryText = shortcut.type == ShortcutItemType.artist
        ? 'Artist'
        : shortcut.type == ShortcutItemType.album
            ? 'Album'
            : 'Playlist';

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widgetBuilder()),
            );
            onTap();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              shortcut.type == ShortcutItemType.artist ? CircleImageWidget(id: shortcut.imageId, size: constraints.maxWidth) : SquareImageWidget(id: shortcut.imageId, size: constraints.maxWidth),
              SizedBox(
                height: StyleConstant.row.contentBoxHeight,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget(text: shortcut.name, textAlign: TextAlign.center),
                      TextWidget(text: secondaryText, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
