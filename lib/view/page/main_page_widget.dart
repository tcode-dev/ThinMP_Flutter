import 'package:flutter/material.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/main_menu_constant.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/provider/page/main_menu_provider.dart';
import 'package:thinmpf/provider/page/main_menu_visibility_provider.dart';
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

  void _load() async {
    await ref.read(mainMenuVisibilityProvider.notifier).load();
    await ref.read(mainMenuProvider.notifier).loadMain();
    final mainMenuVisibility = ref.watch(mainMenuVisibilityProvider);

    if (mainMenuVisibility[MainMenuConstant.shortcut]!) {
      ref.read(shortcutProvider.notifier).fetch();
    } else {
      ref.read(shortcutProvider.notifier).clear();
    }

    if (mainMenuVisibility[MainMenuConstant.recent]!) {
      ref.read(albumsProvider.notifier).fetchRecent();
    } else {
      ref.read(albumsProvider.notifier).clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final shortcuts = ref.watch(shortcutProvider);
    final albums = ref.watch(albumsProvider);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              MainTitleWidget(title: localizations.library, callback: _load),
              MainMenuWidget(callback: _load),
              if (shortcuts.isNotEmpty) ...[
                SectionTitleWidget(title: localizations.shortcut),
                ShortcutGridWidget(callback: _load),
              ],
              if (albums.isNotEmpty) ...[
                SectionTitleWidget(title: localizations.recentlyAdded),
                AlbumGridWidget(callback: _load),
              ],
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
