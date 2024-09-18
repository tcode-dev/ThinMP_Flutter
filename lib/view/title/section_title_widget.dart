import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;

  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
        child: TextWidget(text: title, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
