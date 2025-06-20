// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/api/player_api.dart';

part 'player_api_factory_provider.g.dart';

@riverpod
PlayerApi playerApiFactory(PlayerApiFactoryRef ref) {
  return PlayerApi(ref);
}
