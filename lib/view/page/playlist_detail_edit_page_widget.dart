import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
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
    ref.read(playlistDetailProvider.notifier).fetchPlaylist(widget.id);
    await ref.read(songsProvider.notifier).fetchPlaylistSongs(widget.id);

    final playlist = ref.read(playlistDetailProvider);
    final songs = ref.read(songsProvider);

    _controller.text = playlist?.name ?? '';

    setState(() {
      // buildに実装するとドラッグ時にMediaRowWidgetが再構築され続け画面がちらつくのでここで一度だけ構築する
      _widgetList = songs.map((model) => MediaRowWidget(song: model)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(StyleConstant.padding.large),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: AppLocalizations.of(context)!.playlistName,
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
              setState(
                () {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = _widgetList.removeAt(oldIndex);
                  _widgetList.insert(newIndex, item);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
