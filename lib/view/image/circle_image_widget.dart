import 'package:flutter/material.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class CircleImageWidget extends StatelessWidget {
  final String id;
  final double size;

  const CircleImageWidget({
    super.key,
    required this.id,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: ImageWidget(id: id, size: size),
    );
  }
}
