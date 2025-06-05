// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/config/player_config_factory_provider.dart';

part 'repeat_provider.g.dart';

@riverpod
class Repeat extends _$Repeat {
  @override
  Future<RepeatMode> build() async {
    return _loadRepeat();
  }

  Future<void> changeRepeat() async {
    final playerApi = ref.read(playerApiFactoryProvider);
    final repeat = switch (state.value) {
      RepeatMode.off => RepeatMode.one,
      RepeatMode.one => RepeatMode.all,
      RepeatMode.all => RepeatMode.off,
      null => RepeatMode.off,
    };

    state = AsyncValue.data(repeat);
    await _saveRepeat(repeat);
    await playerApi.repeat();
  }

  Future<RepeatMode> _loadRepeat() async {
    final playerConfig = ref.read(playerConfigFactoryProvider);

    return playerConfig.loadRepeat();
  }

  Future<void> _saveRepeat(RepeatMode repeat) async {
    final playerConfig = ref.read(playerConfigFactoryProvider);

    await playerConfig.saveRepeat(repeat);
  }
}
