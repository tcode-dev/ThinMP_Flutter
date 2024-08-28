import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_shuffle_provider.g.dart';

@riverpod
class IsShuffle extends _$IsShuffle {
  @override
  bool build() => false;

  void setIsShuffle(bool isShuffle) {
    state = isShuffle;
  }
}
