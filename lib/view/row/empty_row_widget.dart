import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';

class EmptyRowWidget extends StatelessWidget {
  const EmptyRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).padding.bottom + styleConstant[StyleType.height][SizeConstant.small];

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Container(),
    );
  }
}