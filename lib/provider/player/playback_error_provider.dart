// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playback_error_provider.g.dart';

@riverpod
class PlaybackError extends _$PlaybackError {
  @override
  String build() => '';

  void notify(String message) {
    state = message;
  }
}
