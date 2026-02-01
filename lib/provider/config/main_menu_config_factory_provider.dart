// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/config/main_menu_config.dart';

part 'main_menu_config_factory_provider.g.dart';

@riverpod
MainMenuConfig mainMenuConfigFactory(Ref ref) {
  return MainMenuConfig();
}
