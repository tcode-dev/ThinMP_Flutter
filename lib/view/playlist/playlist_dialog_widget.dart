import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';

class PlaylistDialogWidget extends ConsumerStatefulWidget {
  final String songId;

  const PlaylistDialogWidget({super.key, required this.songId});

  @override
  PlaylistDialogWidgetState createState() => PlaylistDialogWidgetState();
}

class PlaylistDialogWidgetState extends ConsumerState<PlaylistDialogWidget> {
  final controller = TextEditingController();
  bool _isNewPlaylist = false;

  void _create() {
    ref.read(playlistsProvider.notifier).create(controller.text, widget.songId);
  }

  void _add(String playlistId) {
    ref.read(playlistsProvider.notifier).add(playlistId, widget.songId);
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(playlistsProvider);

    return asyncValue.when(
      loading: () => const LoadingWidget(),
      error: (Object error, StackTrace stackTrace) {
        return ErrorWidget(error);
      },
      data: (vm) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.playlist, textAlign: TextAlign.center),
          content: vm.playlists.isEmpty || _isNewPlaylist
              ? TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: AppLocalizations.of(context)!.playlistName,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final playlist in vm.playlists)
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
            _isNewPlaylist
                ? TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: Text(AppLocalizations.of(context)!.done),
                    onPressed: () {
                      _create();
                      Navigator.of(context).pop();
                    },
                  )
                : TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: Text(AppLocalizations.of(context)!.playlistCreate),
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
              child: Text(AppLocalizations.of(context)!.cancel),
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
      },
    );
  }
}
