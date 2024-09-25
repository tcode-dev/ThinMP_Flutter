import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final double size;
  final double? imageSize;
  final VoidCallback callback;

  const ButtonWidget({super.key, required this.icon, required this.size, required this.callback, this.imageSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, size: imageSize ?? size),
      ),
    );
  }
}
