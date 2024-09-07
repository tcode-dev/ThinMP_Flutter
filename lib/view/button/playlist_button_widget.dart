import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/playlist/playlist_dialog_widget.dart';

class PlaylistButtonWidget extends StatelessWidget {
  const PlaylistButtonWidget({super.key});

  void _addPlaylist(BuildContext context) {
    PlaylistDialogWidget.showPlaylistRegister(context);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.playlist_add_rounded, size: StyleConstant.button.small, callback: () => _addPlaylist(context));
  }
}
