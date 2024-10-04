import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';

class ListTileRowWidget extends StatelessWidget {
  final Widget child;

  const ListTileRowWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListItemRowWidget(
      child: ListTile(
        minVerticalPadding: 0.0,
        contentPadding: EdgeInsets.only(right: StyleConstant.padding.large),
        title: Center(
          child: child,
        ),
        trailing: const ReorderableDragStartListener(
          index: 0,
          child: Icon(Icons.drag_handle),
        ),
      ),
    );
  }
}
