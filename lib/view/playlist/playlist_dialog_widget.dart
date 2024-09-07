import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/repository/playlist_repository.dart';

class PlaylistDialogWidget extends ConsumerStatefulWidget {
  final String songId;
 
  const PlaylistDialogWidget({super.key, required this.songId});

  @override
  PlaylistDialogWidgetState createState() => PlaylistDialogWidgetState();
}

class PlaylistDialogWidgetState extends ConsumerState<PlaylistDialogWidget> {
  final controller = TextEditingController();

  void _create() {
    final repository = PlaylistRepository();
    repository.create(controller.text, widget.songId);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.newPlaylist),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: AppLocalizations.of(context)!.playlistName,
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(AppLocalizations.of(context)!.done),
          onPressed: () {
            _create();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
