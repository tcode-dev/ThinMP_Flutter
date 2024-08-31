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
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.only(top: 5, right: 10, bottom: 5),
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
