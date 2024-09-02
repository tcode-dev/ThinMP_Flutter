import 'package:flutter/material.dart';
import 'package:thinmpf/view/menu/context_menu.dart';

class SongContextMenuWidget extends StatelessWidget {
  final Widget child;

  const SongContextMenuWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ContextMenuWidget(
      items: const [
        PopupMenuItem(
          value: 'favorite',
          child: Text('add to favorites'),
        ),
        PopupMenuItem(
          value: 'playlist',
          child: Text('add to playlist'),
        ),
      ],
      onSelected: (String value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: $value')),
        );
      },
      child: child,
    );
  }
}
