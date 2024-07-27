import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_playing_provider.g.dart';

@riverpod
class IsPlaying extends _$IsPlaying {
  @override
  bool build() => false;

  void updateState(bool isPlaying) {
    state = isPlaying;
  }
}