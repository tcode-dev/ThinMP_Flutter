import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final double buttonSize;
  final double imageSize;
  final VoidCallback callback;

  const ButtonWidget({Key? key, required this.icon, required this.buttonSize, required this.imageSize, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
