import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/provider/page/favorite_songs_provider.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

class FavoriteSongsEditPageWidget extends ConsumerStatefulWidget {
  const FavoriteSongsEditPageWidget({super.key});

  @override
  FavoriteSongsEditPageWidgetState createState() => FavoriteSongsEditPageWidgetState();
}

class FavoriteSongsEditPageWidgetState extends ConsumerState<FavoriteSongsEditPageWidget> {
  late List<SongModel> _list;

  @override
  void initState() {
    super.initState();

    final asyncValue = ref.read(favoriteSongsProvider);
    asyncValue.when(
      data: (vm) {
        _list = List.from(vm.songs);
      },
      loading: () {
        _list = [];
      },
      error: (error, stackTrace) {
        _list = [];
      },
    );
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
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        actions: [
          TextButton(
            onPressed: () {},
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
