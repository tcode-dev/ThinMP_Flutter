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
      padding: EdgeInsets.only(right: StyleConstant.padding.small),
      child: TextWidget(text: title),
    );
  }
}
