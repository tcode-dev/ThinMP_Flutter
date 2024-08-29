import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'repeat_provider.g.dart';

@riverpod
class Repeat extends _$Repeat {
  @override
  RepeatMode build() => RepeatMode.off;

  void changeRepeat() {
    switch (state) {
      case RepeatMode.off:
        state = RepeatMode.one;
        break;
      case RepeatMode.one:
        state = RepeatMode.all;
        break;
      case RepeatMode.all:
        state = RepeatMode.off;
        break;
    }
  }
}
