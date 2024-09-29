import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/main_menu_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/config/main_menu_config_factory_provider.dart';
import 'package:thinmpf/provider/page/main_menu_provider.dart';
import 'package:thinmpf/view/row/checkbox_row_widget.dart';
import 'package:thinmpf/view/row/list_item_row_widget.dart';

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
  List<Widget> _menuList = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await ref.read(mainMenuProvider.notifier).load();

    final mainMenu = ref.read(mainMenuProvider);

    setState(() {
      final localizations = AppLocalizations.of(context)!;
      _menuList = mainMenu.map((menu) => CheckboxRowWidget(key: Key(menu.item.index.toString()), title: _mainMenuTextMap[menu.item]!(localizations), initialChecked: menu.visibility)).toList();
    });
  }

  void _update() {
    final mainMenuConfig = ref.read(mainMenuConfigFactoryProvider);

    final sorted = _menuList
        .map((menu) {
          final String menuKeyString = menu.key is ValueKey ? (menu.key as ValueKey).value : menu.key.toString();

          return MainMenuConstant.values[int.parse(menuKeyString)];
        })
        .cast<MainMenuConstant>()
        .toList();

    mainMenuConfig.saveSort(sorted);

    // final Map<MainMenuConstant, bool> visibilityMap = Map.fromIterable(
    //   _menuList,
    //   key: (value) => MainMenuConstant.values[int.parse((value.key as ValueKey).toString())],
    //   value: (entry) => entry.value.checked,
    // );

    // mainMenuConfig.saveVisibility(visibilityMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.edit),
        leadingWidth: 100,
        leading: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _update();
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.done),
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
                    minVerticalPadding: 0.0,
                    contentPadding: EdgeInsets.only(right: StyleConstant.padding.large),
                    title: Center(
                      child: _menuList[index],
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
        ],
      ),
    );
  }
}
