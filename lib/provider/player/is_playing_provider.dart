import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_playing_provider.g.dart';

@riverpod
class IsPlaying extends _$IsPlaying {
  @override
  bool build() => true;

  void setIsPlaying(bool isPlaying) {
    state = isPlaying;
  }
}
