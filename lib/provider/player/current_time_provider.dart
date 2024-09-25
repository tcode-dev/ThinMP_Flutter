import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';

part 'current_time_provider.g.dart';

@riverpod
class CurrentTime extends _$CurrentTime {
  @override
  double build() => 0;

  void updateCurrentTime() async {
    final playerApi = ref.read(playerApiFactoryProvider);

    state = await playerApi.getCurrentTime();
  }

  void seek(double time) {
    state = time;
  }
}
