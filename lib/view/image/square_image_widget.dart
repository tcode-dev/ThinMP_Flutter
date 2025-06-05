// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
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
      borderRadius: BorderRadius.circular(StyleConstant.radius.small),
      child: ImageWidget(id: id, size: size),
    );
  }
}
