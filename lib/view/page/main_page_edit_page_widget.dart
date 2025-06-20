// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/main_menu_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/model/media/main_menu_model.dart';
import 'package:thinmpf/provider/config/main_menu_config_factory_provider.dart';
import 'package:thinmpf/provider/page/main_menu_provider.dart';
import 'package:thinmpf/provider/page/main_menu_visibility_provider.dart';
import 'package:thinmpf/provider/page/shortcut_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/row/checkbox_row_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/list_tile_row_widget.dart';
import 'package:thinmpf/view/row/shortcut_row_widget.dart';
import 'package:thinmpf/view/title/section_title_widget.dart';

final Map<MainMenuConstant, Function(AppLocalizations localizations)> _mainMenuTextMap = {
  MainMenuConstant.artists: (AppLocalizations localizations) => localizations.artists,
  MainMenuConstant.albums: (AppLocalizations localizations) => localizations.albums,
  MainMenuConstant.songs: (AppLocalizations localizations) => localizations.songs,
  MainMenuConstant.favoriteSong: (AppLocalizations localizations) => localizations.favoriteSong,
  MainMenuConstant.favoriteArtist: (AppLocalizations localizations) => localizations.favoriteArtist,
  MainMenuConstant.playlists: (AppLocalizations localizations) => localizations.playlists,
};

class MainPageEditPageWidget extends ConsumerStatefulWidget {
  const MainPageEditPageWidget({super.key});

  @override
  MainPageEditPageWidgetState createState() => MainPageEditPageWidgetState();
}

class MainPageEditPageWidgetState extends ConsumerState<MainPageEditPageWidget> {
  List<MainMenuModel> _menuList = [];
  bool _shortcutChecked = false;
  bool _recentChecked = false;
  List<ShortcutRowWidget> _shortcutWidgetList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  Future<void> _load() async {
    await ref.read(shortcutProvider.notifier).fetch();
    await ref.read(mainMenuProvider.notifier).loadEdit();
    await ref.read(mainMenuVisibilityProvider.notifier).load();

    final shortcuts = ref.watch(shortcutProvider);
    final mainMenu = ref.watch(mainMenuProvider);
    final mainMenuVisibility = ref.watch(mainMenuVisibilityProvider);

    setState(() {
      _menuList = List.from(mainMenu);
      _shortcutChecked = mainMenuVisibility[MainMenuConstant.shortcut]!;
      _recentChecked = mainMenuVisibility[MainMenuConstant.recent]!;
      _shortcutWidgetList = shortcuts.map((model) => ShortcutRowWidget(shortcut: model)).toList();
    });
  }

  Future<void> _update() async {
    final mainMenuConfig = ref.read(mainMenuConfigFactoryProvider);
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final sorted = _menuList.map((menu) => menu.item).cast<MainMenuConstant>().toList();
    final shortcutIds = _shortcutWidgetList.map((model) => model.shortcut.id).toList().reversed.toList();
    final visibilityMap = Map.fromEntries(_menuList.map((entry) => MapEntry(entry.item, entry.visibility)));
    visibilityMap[MainMenuConstant.shortcut] = _shortcutChecked;
    visibilityMap[MainMenuConstant.recent] = _recentChecked;

    shortcutRepository.update(shortcutIds);
    await mainMenuConfig.saveSort(sorted);
    await mainMenuConfig.saveVisibility(visibilityMap);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  void _onChangedMenu(int index, bool value) {
    setState(() {
      _menuList[index].visibility = value;
    });
  }

  void _onChangedShortcut(bool value) {
    setState(() {
      _shortcutChecked = value;
    });
  }

  void _onChangedRecent(bool value) {
    setState(() {
      _recentChecked = value;
    });
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
            },
            child: Text(localizations.done),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverReorderableList(
            itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
              key: Key(index.toString()),
              index: index,
              child: Material(
                child: ListTileRowWidget(
                  child: CheckboxRowWidget(
                    key: Key(_menuList[index].item.index.toString()),
                    text: _mainMenuTextMap[_menuList[index].item]!(localizations),
                    checked: _menuList[index].visibility,
                    onChanged: (bool checked) => _onChangedMenu(index, checked),
                  ),
                ),
              ),
            ),
            itemCount: _menuList.length,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = _menuList.removeAt(oldIndex);
                _menuList.insert(newIndex, item);
              });
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: StyleConstant.row.listTileHeight,
              child: ListItemRowWidget(
                child: CheckboxRowWidget(
                  text: localizations.shortcut,
                  checked: _shortcutChecked,
                  onChanged: _onChangedShortcut,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: StyleConstant.row.listTileHeight,
              child: ListItemRowWidget(
                child: CheckboxRowWidget(
                  text: localizations.recentlyAdded,
                  checked: _recentChecked,
                  onChanged: _onChangedRecent,
                ),
              ),
            ),
          ),
          SectionTitleWidget(title: localizations.shortcut),
          SliverReorderableList(
            itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
              key: Key(_shortcutWidgetList[index].shortcut.id),
              index: index,
              child: Material(
                child: Dismissible(
                  key: Key(_shortcutWidgetList[index].shortcut.id),
                  onDismissed: (direction) {
                    setState(() {
                      _shortcutWidgetList.removeAt(index);
                    });
                  },
                  child: ListTileRowWidget(
                    child: Center(
                      child: _shortcutWidgetList[index],
                    ),
                  ),
                ),
              ),
            ),
            itemCount: _shortcutWidgetList.length,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = _shortcutWidgetList.removeAt(oldIndex);
                _shortcutWidgetList.insert(newIndex, item);
              });
            },
          ),
          const EmptyRowWidget(),
        ],
      ),
    );
  }
}
