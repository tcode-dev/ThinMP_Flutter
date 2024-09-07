import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/playlist/playlist_dialog_widget.dart';

class PlaylistButtonWidget extends StatelessWidget {
  const PlaylistButtonWidget({super.key});

  Future<void> _showPlaylistDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const PlaylistDialogWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      icon: Icons.playlist_add_rounded,
      size: StyleConstant.button.small,
      callback: () => _showPlaylistDialog(context),
    );
  }
}
