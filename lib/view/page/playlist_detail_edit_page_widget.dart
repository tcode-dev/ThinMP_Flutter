// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/provider/page/playlist_detail_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
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
  List<MediaRowWidget> _widgetList = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  Future<void> _load() async {
    await ref.read(songsProvider.notifier).fetchPlaylistSongs(widget.id);

    final playlist = ref.read(playlistDetailProvider(widget.id));
    final songs = ref.read(songsProvider);

    _controller.text = playlist?.name ?? '';

    setState(() {
      // buildに実装するとドラッグ時にMediaRowWidgetが再構築され続け画面がちらつくのでここで一度だけ構築する
      _widgetList = songs.map((model) => MediaRowWidget(song: model)).toList();
    });
  }

  void _update() {
    final playlistRepository = ref.read(playlistRepositoryFactoryProvider);

    playlistRepository.updatePlaylistDetail(widget.id, _controller.text, _widgetList.map((model) => model.song.id).toList());
  }

  void _delete() {
    final playlistRepository = ref.read(playlistRepositoryFactoryProvider);

    playlistRepository.delete(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(localizations.edit),
        leadingWidth: 100,
        leading: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(localizations.cancel),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _update();
              Navigator.of(context).pop();
            },
            child: Text(localizations.done),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(StyleConstant.padding.large),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: localizations.playlistName,
                ),
              ),
            ),
          ),
          SliverReorderableList(
            itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
              key: Key(_widgetList[index].song.id),
              index: index,
              child: Material(
                child: Dismissible(
                  key: Key(_widgetList[index].song.id),
                  onDismissed: (direction) {
                    setState(() {
                      _widgetList.removeAt(index);
                    });
                  },
                  child: ListItemRowWidget(
                    child: ListTile(
                      minVerticalPadding: 0.0,
                      contentPadding: EdgeInsets.only(right: StyleConstant.padding.large),
                      title: Center(
                        child: _widgetList[index],
                      ),
                      trailing: const ReorderableDragStartListener(
                        index: 0,
                        child: Icon(Icons.drag_handle),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            itemCount: _widgetList.length,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = _widgetList.removeAt(oldIndex);
                _widgetList.insert(newIndex, item);
              });
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(StyleConstant.button.small),
              child: TextButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(localizations.playlistRemoveConfirm, textAlign: TextAlign.center),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: Text(localizations.playlistRemove),
                            onPressed: () {
                              _delete();
                              Navigator.of(context).pop();
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
                    },
                  );
                },
                child: Text(localizations.playlistRemove),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
