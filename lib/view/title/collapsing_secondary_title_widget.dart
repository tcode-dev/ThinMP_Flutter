// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class CollapsingSecondaryTitleWidget extends StatelessWidget {
  final String? title;

  const CollapsingSecondaryTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: StyleConstant.row.contentBoxHeight,
        padding: EdgeInsets.symmetric(horizontal: StyleConstant.padding.large),
        child: Center(
          child: TextWidget(text: title ?? ''),
        ),
      ),
    );
  }
}
