import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'player_host_api_factory_provider.g.dart';

@riverpod
PlayerHostApi playerHostApiFactory(PlayerHostApiFactoryRef ref) {
  return PlayerHostApi();
}
