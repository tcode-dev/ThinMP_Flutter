// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/shortcut_repository.dart';

part 'shortcut_repository_factory_provider.g.dart';

@riverpod
ShortcutRepository shortcutRepositoryFactory(ShortcutRepositoryFactoryRef ref) {
  return ShortcutRepository();
}
