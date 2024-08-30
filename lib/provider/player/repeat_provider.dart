import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/config/player_config.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'repeat_provider.g.dart';

final PlayerHostApi _player = PlayerHostApi();

@riverpod
class Repeat extends _$Repeat {
  @override
  Future<RepeatMode> build() async {
    return _loadRepeat();
  }

  Future<void> changeRepeat() async {
    final repeat = switch (state.value) {
      RepeatMode.off => RepeatMode.one,
      RepeatMode.one => RepeatMode.all,
      RepeatMode.all => RepeatMode.off,
      null => RepeatMode.off,
    };

    state = AsyncValue.data(repeat);
    await _player.setRepeat(repeat);
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
