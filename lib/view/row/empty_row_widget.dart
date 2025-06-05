// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';

class EmptyRowWidget extends StatelessWidget {
  const EmptyRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).padding.bottom + StyleConstant.row.contentBoxHeight,
        child: Container(),
      ),
    );
  }
}
