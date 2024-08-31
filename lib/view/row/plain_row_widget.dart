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
      height: StyleConstant.height.contentBox,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: StyleConstant.padding.small),
      padding: EdgeInsets.only(top: StyleConstant.padding.tiny, right: StyleConstant.padding.small, bottom: StyleConstant.padding.tiny),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x1F000000),
            width: 1,
          ),
        ),
      ),
      child: TextWidget(text: title),
    );
  }
}
