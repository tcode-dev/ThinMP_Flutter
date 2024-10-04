import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/playlist_model.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/list_tile_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class PlaylistsEditPageWidget extends ConsumerStatefulWidget {
  const PlaylistsEditPageWidget({super.key});

  @override
  PlaylistsEditPageWidgetState createState() => PlaylistsEditPageWidgetState();
}

class PlaylistsEditPageWidgetState extends ConsumerState<PlaylistsEditPageWidget> {
  List<PlaylistModel> _list = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  Future<void> _load() async {
    ref.read(playlistsProvider.notifier).fetchPlaylists();

    final playlists = ref.watch(playlistsProvider);

    setState(() {
      _list = List.from(playlists);
    });
  }

  void _updatePlaylists() {
    final playlistRepository = ref.read(playlistRepositoryFactoryProvider);

    playlistRepository.updatePlaylists(_list.map((model) => model.id).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.edit),
        leadingWidth: 100,
        leading: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _updatePlaylists();
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.done),
          )
        ],
      ),
      body: ReorderableListView(
        children: [
          for (int index = 0; index < _list.length; index += 1)
            Dismissible(
              key: Key(_list[index].id),
              onDismissed: (direction) {
                setState(() {
                  _list.removeAt(index);
                });
              },
              child: ListTileRowWidget(
                child: PlainRowWidget(title: _list[index].name),
              ),
            )
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = _list.removeAt(oldIndex);
            _list.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
