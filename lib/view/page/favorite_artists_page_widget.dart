import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/provider/page/artists_provider.dart';
import 'package:thinmpf/view/list/artist_list_widget.dart';
import 'package:thinmpf/view/page/favorite_artists_edit_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class FavoriteArtistsPageWidget extends ConsumerStatefulWidget {
  const FavoriteArtistsPageWidget({super.key});

  @override
  FavoriteArtistsPageWidgetState createState() => FavoriteArtistsPageWidgetState();
}

class FavoriteArtistsPageWidgetState extends ConsumerState<FavoriteArtistsPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(artistsProvider.notifier).fetchFavoriteArtists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.favoriteArtist),
        actions: [
          PopupMenuButton(
            onSelected: (item) async {
              if (item == editLabel) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteArtistsEditPageWidget()),
                );

                _load();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: editLabel,
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
              ArtistListWidget(callback: _load),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
