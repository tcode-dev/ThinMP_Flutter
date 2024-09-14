import 'package:flutter/material.dart';
import 'package:thinmpf/view/menu/list_context_menu.dart';

class SongContextMenuWidget extends StatelessWidget {
  final Function() callback;
  final Widget child;

  const SongContextMenuWidget({super.key, required this.callback, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListContextMenuWidget(
      widgetBuilder: () => [
        const PopupMenuItem(
          value: 'favorite',
          child: Text('add to favorites'),
        ),
        const PopupMenuItem(
          value: 'playlist',
          child: Text('add to playlist'),
        ),
      ],
      onSelected: (String value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: $value')),
        );
        callback();
      },
      child: child,
    );
  }
}
