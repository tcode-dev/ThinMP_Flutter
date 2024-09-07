import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/playlist/playlist_dialog_widget.dart';

class PlaylistButtonWidget extends ConsumerStatefulWidget {
  const PlaylistButtonWidget({super.key});

  @override
  PlaylistButtonWidgetState createState() => PlaylistButtonWidgetState();
}

class PlaylistButtonWidgetState extends ConsumerState<PlaylistButtonWidget> {
  Future<void> _showPlaylistDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final id = ref.read(playbackSongProvider)?.id;

        if (id != null) {
          return PlaylistDialogWidget(songId: id);
        } else {
          return Container();
        }
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
