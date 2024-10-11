import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';

class PlaylistDialogWidget extends ConsumerStatefulWidget {
  final String songId;

  const PlaylistDialogWidget({super.key, required this.songId});

  @override
  PlaylistDialogWidgetState createState() => PlaylistDialogWidgetState();
}

class PlaylistDialogWidgetState extends ConsumerState<PlaylistDialogWidget> {
  final controller = TextEditingController();
  bool _isNewPlaylist = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  void _load() {
    ref.read(playlistsProvider.notifier).fetchPlaylists();
  }

  void _create() {
    ref.read(playlistsProvider.notifier).create(controller.text, widget.songId);
  }

  void _add(String playlistId) {
    ref.read(playlistsProvider.notifier).add(playlistId, widget.songId);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final playlists = ref.watch(playlistsProvider);

    return AlertDialog(
      title: Text(localizations.playlist, textAlign: TextAlign.center),
      content: playlists.isEmpty || _isNewPlaylist
          ? TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: localizations.playlistName,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (final playlist in playlists)
                    ListTile(
                      title: Text(playlist.name),
                      onTap: () {
                        _add(playlist.id);
                        Navigator.of(context).pop();
                      },
                    ),
                ],
              ),
            ),
      actions: [
        playlists.isEmpty || _isNewPlaylist
            ? TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: Text(localizations.done),
                onPressed: () {
                  _create();
                  Navigator.of(context).pop();
                },
              )
            : TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: Text(localizations.playlistCreate),
                onPressed: () {
                  setState(() {
                    _isNewPlaylist = true;
                  });
                },
              ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localizations.cancel),
          onPressed: () {
            if (_isNewPlaylist) {
              setState(() {
                _isNewPlaylist = false;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
