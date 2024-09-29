import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/main_menu_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/main_menu_provider.dart';
import 'package:thinmpf/view/page/albums_page_widget.dart';
import 'package:thinmpf/view/page/artists_page_widget.dart';
import 'package:thinmpf/view/page/favorite_artists_page_widget.dart';
import 'package:thinmpf/view/page/favorite_songs_page_widget.dart';
import 'package:thinmpf/view/page/playlists_page_widget.dart';
import 'package:thinmpf/view/page/songs_page_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class MainMenuItem {
  final String Function(BuildContext context) text;
  final Widget Function() widgetBuilder;

  MainMenuItem({required this.text, required this.widgetBuilder});
}

final Map<MainMenuConstant, MainMenuItem> _mainMenuMap = {
  MainMenuConstant.artists: MainMenuItem(text: (BuildContext context) => AppLocalizations.of(context)!.artists, widgetBuilder: () => const ArtistsPageWidget()),
  MainMenuConstant.albums: MainMenuItem(text: (BuildContext context) => AppLocalizations.of(context)!.albums, widgetBuilder: () => const AlbumsPageWidget()),
  MainMenuConstant.songs: MainMenuItem(text: (BuildContext context) => AppLocalizations.of(context)!.songs, widgetBuilder: () => const SongsPageWidget()),
  MainMenuConstant.favoriteSong: MainMenuItem(text: (BuildContext context) => AppLocalizations.of(context)!.favoriteSong, widgetBuilder: () => const FavoriteSongsPageWidget()),
  MainMenuConstant.favoriteArtist: MainMenuItem(text: (BuildContext context) => AppLocalizations.of(context)!.favoriteArtist, widgetBuilder: () => const FavoriteArtistsPageWidget()),
  MainMenuConstant.playlists: MainMenuItem(text: (BuildContext context) => AppLocalizations.of(context)!.playlists, widgetBuilder: () => const PlaylistsPageWidget()),
};

class MainMenuWidget extends ConsumerWidget {
  final void Function() callback;

  const MainMenuWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenu = ref.watch(mainMenuProvider);

    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final mainMenuItem = _mainMenuMap[mainMenu[index].item]!;

        return GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mainMenuItem.widgetBuilder()),
            );
            callback();
          },
          child: ListItemRowWidget(child: PlainRowWidget(title: mainMenuItem.text(context))),
        );
      }, childCount: mainMenu.length),
    );
  }
}
