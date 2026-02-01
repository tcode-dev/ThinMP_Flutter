// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/config/player_config_factory_provider.dart';

class PlayerApi extends PlayerHostApi {
  final Ref ref;

  PlayerApi(this.ref);

  Future<void> repeat() async {
    final playerConfig = ref.read(playerConfigFactoryProvider);
    final repeat = await playerConfig.loadRepeat();

    await setRepeat(repeat);
  }

  Future<void> shuffle() async {
    final playerConfig = ref.read(playerConfigFactoryProvider);
    final shuffle = await playerConfig.loadShuffle();

    await setShuffle(shuffle);
  }
}
