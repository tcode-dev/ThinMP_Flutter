// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';

class PlaylistDialogWidget extends ConsumerStatefulWidget {
  final String songId;

  const PlaylistDialogWidget({super.key, required this.songId});

  @override
  PlaylistDialogWidgetState createState() => PlaylistDialogWidgetState();
}

class PlaylistDialogWidgetState extends ConsumerState<PlaylistDialogWidget> {
  final controller = TextEditingController();
  bool _isNewPlaylist = false;
  bool _isExist = false;
  String _playlistId = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  Future<void> _load() async {
    await ref.read(playlistsProvider.notifier).fetchPlaylists();
  }

  Future<void> _create() async {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

    await playlistRepository.create(controller.text, widget.songId);
  }

  Future<void> _add(String playlistId) async {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

    await playlistRepository.add(playlistId, widget.songId);
  }

  Future<bool> _exist(String playlistId) async {
    final playlistRepository = ref.read(playlistRepositoryFactoryProvider);

    return await playlistRepository.exists(playlistId, widget.songId);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final playlists = ref.watch(playlistsProvider);

    if (_isExist) {
      return AlertDialog(
        title: Text(localizations.playlist, textAlign: TextAlign.center),
        content: Text(localizations.playlistExistConfirm),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(localizations.playlistAdd),
            onPressed: () async {
              await _add(_playlistId);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(localizations.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    } else if (playlists.isEmpty || _isNewPlaylist) {
      return AlertDialog(
        title: Text(localizations.playlist, textAlign: TextAlign.center),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: localizations.playlistName,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(localizations.done),
            onPressed: () async {
              await _create();
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(localizations.cancel),
            onPressed: () {
              setState(() {
                _isNewPlaylist = false;
              });
            },
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(localizations.playlist, textAlign: TextAlign.center),
        content: SingleChildScrollView(
          child: Column(
            children: [
              for (final playlist in playlists)
                ListTile(
                  title: Text(playlist.name),
                  onTap: () async {
                    final exists = await _exist(playlist.id);
                    if (!exists) {
                      await _add(playlist.id);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    } else {
                      setState(() {
                        _playlistId = playlist.id;
                        _isExist = true;
                      });
                    }
                  },
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
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
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
  }
}
