import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/shortcut_model.dart';
import 'package:thinmpf/provider/page/main_provider.dart';
import 'package:thinmpf/util/calc_grid_aspect_ratio.dart';
import 'package:thinmpf/util/calc_grid_count.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/cell/shortcut_cell_view.dart';
import 'package:thinmpf/view/list/navigation_list_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/menu/album_grid_context_menu.dart';
import 'package:thinmpf/view/menu/artist_grid_context_menu.dart';
import 'package:thinmpf/view/menu/playlist_grid_context_menu.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/page/playlist_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

final shortcutMap = {
  ShortcutItemType.artist: (ShortcutModel shortcut, int index, Function() callback) => ArtistGridContextMenuWidget(
        artistId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => ArtistDetailPageWidget(id: shortcut.itemId), onTap: callback),
      ),
  ShortcutItemType.album: (ShortcutModel shortcut, int index, Function() callback) => AlbumGridContextMenuWidget(
        albumId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => AlbumDetailPageWidget(id: shortcut.itemId), onTap: callback),
      ),
  ShortcutItemType.playlist: (ShortcutModel shortcut, int index, Function() callback) => PlaylistGridContextMenuWidget(
        playlistId: shortcut.itemId,
        index: index,
        callback: callback,
        child: ShortcutCellWidget(shortcut: shortcut, widgetBuilder: () => PlaylistDetailPageWidget(id: shortcut.itemId), onTap: callback),
      ),
};

class MainPageWidget extends ConsumerStatefulWidget {
  const MainPageWidget({super.key});

  @override
  MainPageWidgetState createState() => MainPageWidgetState();
}

class MainPageWidgetState extends ConsumerState<MainPageWidget> {
  void _reload() {
    ref.read(mainProvider.notifier).reload();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(mainProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final gridCount = calcGridCount(screenSize.width);
    final gridAspectRatio = calcGridAspectRatio(screenSize.width, gridCount);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          asyncValue.when(
            loading: () => const LoadingWidget(),
            error: (Object error, StackTrace stackTrace) {
              return ErrorWidget(error);
            },
            data: (vm) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: top, left: StyleConstant.padding.large),
                      child: Text(AppLocalizations.of(context)!.library, style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  ),
                  NavigationListWidget(callback: _reload),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
                      child: Text(AppLocalizations.of(context)!.shortcut, style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(StyleConstant.padding.large),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: gridAspectRatio,
                        crossAxisCount: gridCount,
                        crossAxisSpacing: StyleConstant.padding.large,
                        mainAxisSpacing: StyleConstant.padding.large,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final shortcut = vm!.shortcuts[index];

                          return shortcutMap[shortcut.type]!(shortcut, index, _reload);
                        },
                        childCount: vm?.shortcuts.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
                      child: Text(AppLocalizations.of(context)!.recentlyAdded, style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(StyleConstant.padding.large),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: gridAspectRatio,
                        crossAxisCount: gridCount,
                        crossAxisSpacing: StyleConstant.padding.large,
                        mainAxisSpacing: StyleConstant.padding.large,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final album = vm?.albums[index];

                          return GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AlbumDetailPageWidget(id: album!.id)),
                              );
                              _reload();
                            },
                            child: AlbumCellWidget(album: vm!.albums[index]),
                          );
                        },
                        childCount: vm?.albums.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: EmptyRowWidget(),
                  ),
                ],
              );
            },
          ),
          const Positioned(
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: MiniPlayerWidget(),
          ),
        ],
      ),
    );
  }
}
