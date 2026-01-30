// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/repository/shortcut_repository.dart';

part 'shortcut_repository_factory_provider.g.dart';

@riverpod
ShortcutRepository shortcutRepositoryFactory(Ref ref) {
  return ShortcutRepository();
}
