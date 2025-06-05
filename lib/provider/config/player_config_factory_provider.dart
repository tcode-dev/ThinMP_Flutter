// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/config/player_config.dart';

part 'player_config_factory_provider.g.dart';

@riverpod
PlayerConfig playerConfigFactory(PlayerConfigFactoryRef ref) {
  return PlayerConfig();
}
