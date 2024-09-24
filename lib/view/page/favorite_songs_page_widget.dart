import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/page/favorite_songs_edit_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class FavoriteSongsPageWidget extends ConsumerStatefulWidget {
  const FavoriteSongsPageWidget({super.key});

  @override
  FavoriteSongsPageWidgetState createState() => FavoriteSongsPageWidgetState();
}

class FavoriteSongsPageWidgetState extends ConsumerState<FavoriteSongsPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(songsProvider.notifier).fetchFavoriteSongs();
  }

  void _play(int index) {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);
    final songs = ref.read(songsProvider);
    final songIds = songs.map((song) => song.id).toList();

    playerHostApi.start(index, songIds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.favoriteSong),
        actions: [
          PopupMenuButton(
            onSelected: (item) async {
              if (item == 'edit') {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteSongsEditPageWidget()),
                );

                _load();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'edit',
                child: Text(AppLocalizations.of(context)!.edit),
              ),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SongListWidget(callback: _load, onTap: _play),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
