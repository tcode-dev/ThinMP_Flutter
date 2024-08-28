import 'package:flutter/material.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class ShuffleButtonWidget extends StatelessWidget {
  const ShuffleButtonWidget({super.key});

  void _shuffle() {
    // _player.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.shuffle_rounded, size: 50.0, callback: _shuffle);
  }
}
