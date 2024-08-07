import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class RepeatButtonWidget extends StatelessWidget {
  const RepeatButtonWidget({Key? key}) : super(key: key);

  void _repeat() {
    // _player.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.repeat_rounded, size: SizeConstant.medium, callback: _repeat);
  }
}
