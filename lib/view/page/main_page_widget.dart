import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/provider/page/main_menu_provider.dart';
import 'package:thinmpf/provider/page/shortcut_provider.dart';
import 'package:thinmpf/view/grid/album_grid_widget.dart';
import 'package:thinmpf/view/grid/shortcut_grid_widget.dart';
import 'package:thinmpf/view/menu/main_menu_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/title/main_title_widget.dart';
import 'package:thinmpf/view/title/section_title_widget.dart';

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
    ref.read(mainMenuProvider.notifier).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              MainTitleWidget(title: AppLocalizations.of(context)!.library),
              MainMenuWidget(callback: _load),
              SectionTitleWidget(title: AppLocalizations.of(context)!.shortcut),
              ShortcutGridWidget(callback: _load),
              SectionTitleWidget(title: AppLocalizations.of(context)!.recentlyAdded),
              AlbumGridWidget(callback: _load),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
