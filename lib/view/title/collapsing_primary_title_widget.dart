// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:thinmpf/view/text/text_widget.dart';

class CollapsingPrimaryTitleWidget extends StatelessWidget {
  final String? title;

  const CollapsingPrimaryTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextWidget(text: title ?? ''),
    );
  }
}
