import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';

class ListItemRowWidget extends StatelessWidget {
  final Widget child;

  const ListItemRowWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: StyleConstant.padding.large),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onInverseSurface,
            width: 1.0,
          ),
        ),
      ),
      child: child,
    );
  }
}