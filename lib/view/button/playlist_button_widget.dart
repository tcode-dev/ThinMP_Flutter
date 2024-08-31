import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class PlaylistButtonWidget extends StatelessWidget {
  const PlaylistButtonWidget({Key? key}) : super(key: key);

  void _addPlaylist() {}

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.playlist_add_rounded, size: StyleConstant.button.small, callback: _addPlaylist);
  }
}
