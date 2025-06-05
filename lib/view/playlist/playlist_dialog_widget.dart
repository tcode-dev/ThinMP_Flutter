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

  void _load() {
    ref.read(playlistsProvider.notifier).fetchPlaylists();
  }

  void _create() {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

    playlistRepository.create(controller.text, widget.songId);
  }

  void _add(String playlistId) {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

    playlistRepository.add(playlistId, widget.songId);
  }

  bool _exist(String playlistId) {
    final playlistRepository = ref.read(playlistRepositoryFactoryProvider);

    return playlistRepository.exists(playlistId, widget.songId);
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
            onPressed: () {
              _add(_playlistId);
              Navigator.of(context).pop();
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
            onPressed: () {
              _create();
              Navigator.of(context).pop();
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
                  onTap: () {
                    if (!_exist(playlist.id)) {
                      _add(playlist.id);
                      Navigator.of(context).pop();
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
