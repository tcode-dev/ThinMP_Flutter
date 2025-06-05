// Flutter imports:
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;

  const TextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, overflow: TextOverflow.ellipsis, textAlign: textAlign, style: style);
  }
}
