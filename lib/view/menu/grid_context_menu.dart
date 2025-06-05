// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:thinmpf/util/calc_grid_count.dart';

class GridContextMenuWidget extends StatelessWidget {
  final List<PopupMenuEntry<String>> Function() widgetBuilder;
  final void Function(String) onSelected;
  final int index;
  final Widget child;

  const GridContextMenuWidget({super.key, required this.widgetBuilder, required this.onSelected, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final gridCount = calcGridCount(screenSize.width);
    final position = index % gridCount;

    return GestureDetector(
      onLongPress: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset offset = renderBox.localToGlobal(Offset.zero);

        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            renderBox.size.width * position,
            offset.dy + renderBox.size.height,
            renderBox.size.width * position,
            offset.dy + renderBox.size.height,
          ),
          items: widgetBuilder(),
        ).then((value) {
          if (value != null) {
            onSelected(value);
          }
        });
      },
      child: child,
    );
  }
}
