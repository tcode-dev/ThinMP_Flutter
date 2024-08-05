import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const TextWidget({
    super.key,
    required this.text,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, overflow: TextOverflow.ellipsis, textAlign: textAlign);
  }
}
