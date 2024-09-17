import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/navigation_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/page/albums_page_widget.dart';
import 'package:thinmpf/view/page/artists_page_widget.dart';
import 'package:thinmpf/view/page/favorite_artists_page_widget.dart';
import 'package:thinmpf/view/page/favorite_songs_page_widget.dart';
import 'package:thinmpf/view/page/playlists_page_widget.dart';
import 'package:thinmpf/view/page/songs_page_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class Navigation {
  final String Function(BuildContext context) text;
  final Widget Function() widgetBuilder;

  Navigation({required this.text, required this.widgetBuilder});
}

final Map<NavigationItemConstant, Navigation> navigationMap = {
  NavigationItemConstant.artists: Navigation(text: (BuildContext context) => AppLocalizations.of(context)!.artists, widgetBuilder: () => const ArtistsPageWidget()),
  NavigationItemConstant.albums: Navigation(text: (BuildContext context) => AppLocalizations.of(context)!.albums, widgetBuilder: () => const AlbumsPageWidget()),
  NavigationItemConstant.songs: Navigation(text: (BuildContext context) => AppLocalizations.of(context)!.songs, widgetBuilder: () => const SongsPageWidget()),
  NavigationItemConstant.favoriteSong: Navigation(text: (BuildContext context) => AppLocalizations.of(context)!.favoriteSong, widgetBuilder: () => const FavoriteSongsPageWidget()),
  NavigationItemConstant.favoriteArtist: Navigation(text: (BuildContext context) => AppLocalizations.of(context)!.favoriteArtist, widgetBuilder: () => const FavoriteArtistsPageWidget()),
  NavigationItemConstant.playlists: Navigation(text: (BuildContext context) => AppLocalizations.of(context)!.playlists, widgetBuilder: () => const PlaylistsPageWidget()),
};

class NavigationListWidget extends StatelessWidget {
  final void Function() callback;

  const NavigationListWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: StyleConstant.row.borderBoxHeight,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final navigation = navigationMap[navigationListConstant[index]]!;

        return GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => navigation.widgetBuilder()),
            );
            callback();
          },
          child: ListItemRowWidget(child: PlainRowWidget(title: navigation.text(context))),
        );
      }, childCount: navigationListConstant.length),
    );
  }
}
