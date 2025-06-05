// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/constant/main_menu_constant.dart';
import 'package:thinmpf/provider/config/main_menu_config_factory_provider.dart';

part 'main_menu_visibility_provider.g.dart';

@riverpod
class MainMenuVisibility extends _$MainMenuVisibility {
  @override
  Map<MainMenuConstant, bool> build() => {};

  Future<void> load() async {
    final mainMenuConfig = ref.read(mainMenuConfigFactoryProvider);

    state = await mainMenuConfig.loadVisibility();
  }
}
