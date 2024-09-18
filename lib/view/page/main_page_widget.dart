import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/provider/page/shortcut_provider.dart';
import 'package:thinmpf/view/grid/album_grid_widget.dart';
import 'package:thinmpf/view/grid/shortcut_grid_widget.dart';
import 'package:thinmpf/view/list/navigation_list_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class MainPageWidget extends ConsumerStatefulWidget {
  const MainPageWidget({super.key});

  @override
  MainPageWidgetState createState() => MainPageWidgetState();
}

class MainPageWidgetState extends ConsumerState<MainPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(shortcutProvider.notifier).fetch();
    ref.read(albumsProvider.notifier).fetchRecent();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(top: top, left: StyleConstant.padding.large),
                  child: Text(AppLocalizations.of(context)!.library, style: Theme.of(context).textTheme.headlineLarge),
                ),
              ),
              NavigationListWidget(callback: _load),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
                  child: Text(AppLocalizations.of(context)!.shortcut, style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(StyleConstant.padding.large),
                sliver: ShortcutGridWidget(callback: _load),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
                  child: Text(AppLocalizations.of(context)!.recentlyAdded, style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(StyleConstant.padding.large),
                sliver: AlbumGridWidget(callback: _load),
              ),
              const SliverToBoxAdapter(
                child: EmptyRowWidget(),
              ),
            ],
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
