import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/media/shortcut_model.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/square_image_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class ShortcutCellWidget extends StatelessWidget {
  final ShortcutModel shortcut;
  final Widget Function() widgetBuilder;
  final VoidCallback? callback;

  const ShortcutCellWidget({
    super.key,
    required this.shortcut,
    required this.widgetBuilder,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widgetBuilder()),
            );
            callback?.call();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              shortcut.type == ShortcutConstant.artist ? CircleImageWidget(id: shortcut.imageId, size: constraints.maxWidth) : SquareImageWidget(id: shortcut.imageId, size: constraints.maxWidth),
              SizedBox(
                height: StyleConstant.row.contentBoxHeight,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget(text: shortcut.name, textAlign: TextAlign.center),
                      TextWidget(text: shortcut.getDescription(localizations), textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
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
