import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/model/main_menu_model.dart';
import 'package:thinmpf/provider/config/main_menu_config_factory_provider.dart';

part 'main_menu_provider.g.dart';

@riverpod
class MainMenu extends _$MainMenu {
  @override
  List<MainMenuModel> build() => [];

  Future<void> load() async {
    final mainMenuConfig = ref.read(mainMenuConfigFactoryProvider);
    final sortList = await mainMenuConfig.loadSort();
    final visibilityList = await mainMenuConfig.loadVisibility();

    state = sortList.map((item) => MainMenuModel(item: item, visibility: visibilityList[item] ?? true)).toList();
  }
}
