import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class MainTitleWidget extends StatelessWidget {
  final String title;

  const MainTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(top: top, left: StyleConstant.padding.large),
        child: TextWidget(text: title, style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
