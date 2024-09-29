import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/config/main_menu_config.dart';

part 'main_menu_config_factory_provider.g.dart';

@riverpod
MainMenuConfig mainMenuConfigFactory(MainMenuConfigFactoryRef ref) {
  return MainMenuConfig();
}
