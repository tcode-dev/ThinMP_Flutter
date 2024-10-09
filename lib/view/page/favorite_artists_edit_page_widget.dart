import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/media/artist_model.dart';
import 'package:thinmpf/provider/page/artists_provider.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/list_tile_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class FavoriteArtistsEditPageWidget extends ConsumerStatefulWidget {
  const FavoriteArtistsEditPageWidget({super.key});

  @override
  FavoriteArtistsEditPageWidgetState createState() => FavoriteArtistsEditPageWidgetState();
}

class FavoriteArtistsEditPageWidgetState extends ConsumerState<FavoriteArtistsEditPageWidget> {
  List<ArtistModel> _list = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await ref.read(artistsProvider.notifier).fetchFavoriteArtists();

    final artists = ref.read(artistsProvider);

    setState(() {
      _list = List.from(artists);
    });
  }

  void _update() {
    final favoriteArtistRepository = ref.read(favoriteArtistRepositoryFactoryProvider);

    favoriteArtistRepository.update(_list.map((model) => model.id).toList());
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
