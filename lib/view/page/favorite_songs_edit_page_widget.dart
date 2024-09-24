import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

class FavoriteSongsEditPageWidget extends ConsumerStatefulWidget {
  const FavoriteSongsEditPageWidget({super.key});

  @override
  FavoriteSongsEditPageWidgetState createState() => FavoriteSongsEditPageWidgetState();
}

class FavoriteSongsEditPageWidgetState extends ConsumerState<FavoriteSongsEditPageWidget> {
  List<SongModel> _list = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await ref.read(songsProvider.notifier).fetchFavoriteSongs();

    final songs = ref.read(songsProvider);

    setState(() {
      _list = List.from(songs);
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);

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
              favoriteSongRepository.update(_list.map((model) => model.id).toList());
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
            final SongModel item = _list.removeAt(oldIndex);
            _list.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
