import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class PlainRowWidget extends StatelessWidget {
  final String title;

  const PlainRowWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: StyleConstant.row.contentBoxHeight,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: StyleConstant.padding.large),
      padding: EdgeInsets.only(top: StyleConstant.padding.tiny, right: StyleConstant.padding.small, bottom: StyleConstant.padding.tiny),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onInverseSurface,
            width: 1.0,
          ),
        ),
      ),
      child: TextWidget(text: title),
    );
  }
}
