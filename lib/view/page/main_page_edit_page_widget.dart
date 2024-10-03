import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/main_menu_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/model/main_menu_model.dart';
import 'package:thinmpf/provider/config/main_menu_config_factory_provider.dart';
import 'package:thinmpf/provider/page/main_menu_provider.dart';
import 'package:thinmpf/provider/page/main_menu_visibility_provider.dart';
import 'package:thinmpf/provider/page/shortcut_provider.dart';
import 'package:thinmpf/view/row/checkbox_row_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';
import 'package:thinmpf/view/row/shortcut_row_widget.dart';
import 'package:thinmpf/view/title/section_title_widget.dart';

const double _listTileDefaultHeight = 56.0;

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
    _load();
  }

  Future<void> _load() async {
    await ref.read(mainMenuProvider.notifier).loadEdit();
    await ref.read(mainMenuVisibilityProvider.notifier).load();
    await ref.read(shortcutProvider.notifier).fetch();

    final mainMenu = ref.watch(mainMenuProvider);
    final mainMenuVisibility = ref.watch(mainMenuVisibilityProvider);
    final shortcuts = ref.watch(shortcutProvider);

    setState(() {
      _menuList = List.from(mainMenu);
      _shortcutChecked = mainMenuVisibility[MainMenuConstant.shortcut]!;
      _recentChecked = mainMenuVisibility[MainMenuConstant.recent]!;
      _shortcutWidgetList = shortcuts.map((model) => ShortcutRowWidget(shortcut: model)).toList();
    });
  }

  Future<void> _update() async {
    final mainMenuConfig = ref.read(mainMenuConfigFactoryProvider);
    final sorted = _menuList.map((menu) => menu.item).cast<MainMenuConstant>().toList();
    final visibilityMap = Map.fromEntries(_menuList.map((entry) => MapEntry(entry.item, entry.visibility)));
    visibilityMap[MainMenuConstant.shortcut] = _shortcutChecked;
    visibilityMap[MainMenuConstant.recent] = _recentChecked;

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
      _shortcutChecked = value!;
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
                child: ListItemRowWidget(
                  child: ListTile(
                    dense: false,
                    minVerticalPadding: 0.0,
                    contentPadding: EdgeInsets.only(right: StyleConstant.padding.large),
                    title: CheckboxRowWidget(
                      key: Key(_menuList[index].item.index.toString()),
                      text: _mainMenuTextMap[_menuList[index].item]!(localizations),
                      checked: _menuList[index].visibility,
                      onChanged: (bool checked) => _onChangedMenu(index, checked),
                    ),
                    trailing: const ReorderableDragStartListener(
                      index: 0,
                      child: Icon(Icons.drag_handle),
                    ),
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
              height: _listTileDefaultHeight,
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
              height: _listTileDefaultHeight,
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
                  child: ListItemRowWidget(
                    child: ListTile(
                      minVerticalPadding: 0.0,
                      contentPadding: EdgeInsets.only(right: StyleConstant.padding.large),
                      title: Center(
                        child: _shortcutWidgetList[index],
                      ),
                      trailing: const ReorderableDragStartListener(
                        index: 0,
                        child: Icon(Icons.drag_handle),
                      ),
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
        ],
      ),
    );
  }
}
