import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';

part 'current_time_provider.g.dart';

@riverpod
class CurrentTime extends _$CurrentTime {
  @override
  double build() => 0;

  void updateCurrentTime() async {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);

    state = await playerHostApi.getCurrentTime();
  }

  void seek(double time) {
    state = time;
  }
}
