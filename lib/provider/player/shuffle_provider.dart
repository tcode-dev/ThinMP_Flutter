import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/config/player_config_factory_provider.dart';

part 'shuffle_provider.g.dart';

@riverpod
class Shuffle extends _$Shuffle {
  @override
  Future<ShuffleMode> build() async {
    return _loadShuffle();
  }

  Future<void> changeShuffle() async {
    final playerApi = ref.read(playerApiFactoryProvider);
    final shuffle = state.value == ShuffleMode.off ? ShuffleMode.on : ShuffleMode.off;
    state = AsyncValue.data(shuffle);

    await _saveShuffle(shuffle);
    await playerApi.shuffle();
  }

  Future<ShuffleMode> _loadShuffle() async {
    final playerConfig = ref.read(playerConfigFactoryProvider);

    return playerConfig.loadShuffle();
  }

  Future<void> _saveShuffle(ShuffleMode shuffle) async {
    final playerConfig = ref.read(playerConfigFactoryProvider);

    await playerConfig.saveShuffle(shuffle);
  }
}
