import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/provider/page/playlist_detail_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

class PlaylistDetailEditPageWidget extends ConsumerStatefulWidget {
  final String id;

  const PlaylistDetailEditPageWidget({super.key, required this.id});

  @override
  PlaylistDetailEditPageWidgetState createState() => PlaylistDetailEditPageWidgetState();
}

class PlaylistDetailEditPageWidgetState extends ConsumerState<PlaylistDetailEditPageWidget> {
  String _name = '';
  List<SongModel> _list = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  Future<void> _load() async {
    ref.read(playlistDetailProvider.notifier).fetchPlaylist(widget.id);
    await ref.read(songsProvider.notifier).fetchPlaylistSongs(widget.id);

    final playlist = ref.read(playlistDetailProvider);
    final songs = ref.read(songsProvider);

    setState(() {
      _list = List.from(songs);
      _name = playlist?.name ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

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
              // playlistRepository.update(_list.map((model) => model.id).toList());
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
              child: ListItemRowWidget(
                child: ListTile(
                  minVerticalPadding: 0.0,
                  contentPadding: EdgeInsets.only(right: StyleConstant.padding.large),
                  title: Center(
                    child: MediaRowWidget(song: _list[index]),
                  ),
                  trailing: const ReorderableDragStartListener(
                    index: 0,
                    child: Icon(Icons.drag_handle),
                  ),
                ),
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
