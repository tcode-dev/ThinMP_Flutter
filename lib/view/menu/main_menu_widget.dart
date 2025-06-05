// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/main_menu_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
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
  final String Function(AppLocalizations localizations) text;
  final Widget Function() widgetBuilder;

  MainMenuItem({required this.text, required this.widgetBuilder});
}

final Map<MainMenuConstant, MainMenuItem> _mainMenuMap = {
  MainMenuConstant.artists: MainMenuItem(text: (AppLocalizations localizations) => localizations.artists, widgetBuilder: () => const ArtistsPageWidget()),
  MainMenuConstant.albums: MainMenuItem(text: (AppLocalizations localizations) => localizations.albums, widgetBuilder: () => const AlbumsPageWidget()),
  MainMenuConstant.songs: MainMenuItem(text: (AppLocalizations localizations) => localizations.songs, widgetBuilder: () => const SongsPageWidget()),
  MainMenuConstant.favoriteSong: MainMenuItem(text: (AppLocalizations localizations) => localizations.favoriteSong, widgetBuilder: () => const FavoriteSongsPageWidget()),
  MainMenuConstant.favoriteArtist: MainMenuItem(text: (AppLocalizations localizations) => localizations.favoriteArtist, widgetBuilder: () => const FavoriteArtistsPageWidget()),
  MainMenuConstant.playlists: MainMenuItem(text: (AppLocalizations localizations) => localizations.playlists, widgetBuilder: () => const PlaylistsPageWidget()),
};

class MainMenuWidget extends ConsumerWidget {
  final VoidCallback? callback;

  const MainMenuWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
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
            callback?.call();
          },
          child: ListItemRowWidget(child: PlainRowWidget(title: mainMenuItem.text(localizations))),
        );
      }, childCount: mainMenu.length),
    );
  }
}
