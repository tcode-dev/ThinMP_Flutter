import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class ShuffleButtonWidget extends StatelessWidget {
  const ShuffleButtonWidget({Key? key}) : super(key: key);

  void _shuffle() {
    // _player.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.shuffle_rounded, size: SizeConstant.medium, callback: _shuffle);
  }
}
