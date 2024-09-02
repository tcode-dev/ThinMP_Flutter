import 'package:flutter/material.dart';

class SongMenuWidget extends StatelessWidget {
  final Widget child;
  const SongMenuWidget({
    super.key,
    required this.child,
  });

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
          items: [
            const PopupMenuItem(
              value: 'Option 1',
              child: Text('Option 1'),
            ),
            const PopupMenuItem(
              value: 'Option 2',
              child: Text('Option 2'),
            ),
            const PopupMenuItem(
              value: 'Option 3',
              child: Text('Option 3'),
            ),
          ],
        ).then((value) {
          if (value != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Selected: $value')),
            );
          }
        });
      },
      child: child,
    );
  }
}
