import 'package:flutter/material.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class NextButtonWidget extends StatelessWidget {
  final double size;
  final double? imageSize;

  const NextButtonWidget({Key? key, required this.size, this.imageSize}) : super(key: key);

  void _next() {
    _player.next();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.skip_next_rounded, size: size, imageSize: imageSize, callback: _next);
  }
}
