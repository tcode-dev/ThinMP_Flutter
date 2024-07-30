import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final SizeConstant size;
  final VoidCallback callback;

  const ButtonWidget({Key? key, required this.icon, required this.size, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonSize = styleConstant[StyleType.button][size];
    double imageSize = styleConstant[StyleType.image][size];

    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: Icon(icon, size: imageSize),
      ),
    );
  }
}
