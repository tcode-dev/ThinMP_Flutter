import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/model/media/main_menu_model.dart';
import 'package:thinmpf/provider/config/main_menu_config_factory_provider.dart';

part 'main_menu_provider.g.dart';

@riverpod
class MainMenu extends _$MainMenu {
  @override
  List<MainMenuModel> build() => [];

  Future<void> loadMain() async {
    final mainMenuConfig = ref.read(mainMenuConfigFactoryProvider);
    final sortList = await mainMenuConfig.loadSort();
    final visibilityList = await mainMenuConfig.loadVisibility();
    final list = sortList.map((item) => MainMenuModel(item: item, visibility: visibilityList[item] ?? true)).toList();

    state = list.where((item) => item.visibility).toList();
  }

  Future<void> loadEdit() async {
    final mainMenuConfig = ref.read(mainMenuConfigFactoryProvider);
    final sortList = await mainMenuConfig.loadSort();
    final visibilityList = await mainMenuConfig.loadVisibility();

    state = sortList.map((item) => MainMenuModel(item: item, visibility: visibilityList[item] ?? true)).toList();
  }
}
