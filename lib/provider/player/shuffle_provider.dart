import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'shuffle_provider.g.dart';

@riverpod
class Shuffle extends _$Shuffle {
  @override
  ShuffleMode build() => ShuffleMode.off;

  void changeShuffle() {
    state = state == ShuffleMode.off ? ShuffleMode.on : ShuffleMode.off;
  }
}
