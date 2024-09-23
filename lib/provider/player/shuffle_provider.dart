import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/config/player_config.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';

part 'shuffle_provider.g.dart';

@riverpod
class Shuffle extends _$Shuffle {
  @override
  Future<ShuffleMode> build() async {
    return _loadShuffle();
  }

  Future<void> changeShuffle() async {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);
    final shuffle = state.value == ShuffleMode.off ? ShuffleMode.on : ShuffleMode.off;
    state = AsyncValue.data(shuffle);
    await playerHostApi.setShuffle(shuffle);
    await _saveShuffle(shuffle);
  }

  Future<ShuffleMode> _loadShuffle() async {
    final playerConfig = PlayerConfig();
    return playerConfig.loadShuffle();
  }

  Future<void> _saveShuffle(ShuffleMode shuffle) async {
    final playerConfig = PlayerConfig();
    await playerConfig.saveShuffle(shuffle);
  }
}
