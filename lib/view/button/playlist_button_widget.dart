import 'package:flutter/material.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class PlaylistButtonWidget extends StatelessWidget {
  const PlaylistButtonWidget({Key? key}) : super(key: key);

  void _addPlaylist() {

  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.playlist_add_rounded, size: 50.0, callback: _addPlaylist);
  }
}
