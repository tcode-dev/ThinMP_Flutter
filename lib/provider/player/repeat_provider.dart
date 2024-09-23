import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/config/player_config.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';

part 'repeat_provider.g.dart';

@riverpod
class Repeat extends _$Repeat {
  @override
  Future<RepeatMode> build() async {
    return _loadRepeat();
  }

  Future<void> changeRepeat() async {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);

    final repeat = switch (state.value) {
      RepeatMode.off => RepeatMode.one,
      RepeatMode.one => RepeatMode.all,
      RepeatMode.all => RepeatMode.off,
      null => RepeatMode.off,
    };

    state = AsyncValue.data(repeat);
    await playerHostApi.setRepeat(repeat);
    await _saveRepeat(repeat);
  }

  Future<RepeatMode> _loadRepeat() async {
    final playerConfig = PlayerConfig();
    return playerConfig.loadRepeat();
  }

  Future<void> _saveRepeat(RepeatMode repeat) async {
    final playerConfig = PlayerConfig();
    await playerConfig.saveRepeat(repeat);
  }
}
