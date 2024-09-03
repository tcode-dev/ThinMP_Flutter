import 'package:flutter/material.dart';

class ContextMenuWidget extends StatelessWidget {
  final Widget child;
  final List<PopupMenuEntry<String>> items;
  final void Function(String) onSelected;

  const ContextMenuWidget({super.key, required this.child, required this.items, required this.onSelected});

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
          items: items,
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