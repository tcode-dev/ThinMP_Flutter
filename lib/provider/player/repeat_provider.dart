import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'repeat_provider.g.dart';

@riverpod
class Repeat extends _$Repeat {
  @override
  RepeatState build() => RepeatState.off;

  void setRepeatState(RepeatState repeatState) {
    state = repeatState;
  }
}
