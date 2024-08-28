import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'current_time_provider.g.dart';

@riverpod
class CurrentTime extends _$CurrentTime {
  @override
  double build() => 0;

  void updateCurrentTime() async {
    final api = PlayerHostApi();

    state = await api.getCurrentTime();
  }

  void seek(double time) {
    state = time;
  }
}
