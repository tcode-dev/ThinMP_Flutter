import 'package:flutter/material.dart';

class ListContextMenuWidget extends StatelessWidget {
  final Widget child;
  final List<PopupMenuEntry<String>> Function() widgetBuilder;
  final void Function(String) onSelected;

  const ListContextMenuWidget({super.key, required this.child, required this.widgetBuilder, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset offset = renderBox.localToGlobal(Offset.zero);

        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            offset.dx + renderBox.size.width,
            offset.dy + renderBox.size.height,
            0,
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
