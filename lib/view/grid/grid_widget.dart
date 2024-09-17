import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/util/calc_grid_aspect_ratio.dart';
import 'package:thinmpf/util/calc_grid_count.dart';

class GridWidget extends StatelessWidget {
  final SliverChildBuilderDelegate delegate;

  const GridWidget({super.key, required this.delegate});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final gridCount = calcGridCount(screenSize.width);
    final gridAspectRatio = calcGridAspectRatio(screenSize.width, gridCount);

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: gridAspectRatio,
        crossAxisCount: gridCount,
        crossAxisSpacing: StyleConstant.padding.large,
        mainAxisSpacing: StyleConstant.padding.large,
      ),
      delegate: delegate,
    );
  }
}
