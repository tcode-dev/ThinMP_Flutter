import 'package:flutter/material.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class PrevButtonWidget extends StatelessWidget {
  const PrevButtonWidget({Key? key}) : super(key: key);

  void _prev() {
    _player.prev();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.skip_previous_rounded, size: 75.0, callback: _prev);
  }
}
