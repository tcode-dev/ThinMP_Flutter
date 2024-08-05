import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class SquareImageWidget extends StatelessWidget {
  final String id;
  final double size;

  const SquareImageWidget({
    super.key,
    required this.id,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(styleConstant[StyleType.radius]),
      child: ImageWidget(id: id, size: size),
    );
  }
}
