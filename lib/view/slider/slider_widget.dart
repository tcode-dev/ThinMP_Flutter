// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/player/current_time_provider.dart';
import 'package:thinmpf/provider/player/is_playing_provider.dart';
import 'package:thinmpf/provider/player/playback_song_provider.dart';
import 'package:thinmpf/util/device_util.dart';

class SliderWidget extends ConsumerStatefulWidget {
  const SliderWidget({super.key});

  @override
  SliderWidgetState createState() => SliderWidgetState();
}

class SliderWidgetState extends ConsumerState<SliderWidget> {
  static const scale = 1000.0;
  static const durationSeconds = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    final isPlaying = ref.read(isPlayingProvider);

    if (isPlaying) {
      _startTimer();
    } else {
      ref.read(currentTimeProvider.notifier).updateCurrentTime();
    }
  }

  @override
  void dispose() {
    _stopTimer();

    super.dispose();
  }

  void _startTimer() {
    ref.read(currentTimeProvider.notifier).updateCurrentTime();

    _timer = Timer.periodic(const Duration(seconds: durationSeconds), (timer) {
      ref.read(currentTimeProvider.notifier).updateCurrentTime();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String _formatDuration(double seconds) {
    int totalSeconds = seconds.toInt();
    int minutes = totalSeconds ~/ 60;
    int remainingSeconds = totalSeconds % 60;

    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  double _toSliderValue(double currentTime, double duration) {
    if (duration == 0) {
      return 0;
    }

    final sliderValue = (currentTime / duration) * scale;

    return sliderValue.clamp(0, scale);
  }

  double _toCurrentTime(double sliderValue) {
    final playbackSong = ref.read(playbackSongProvider);

    if (playbackSong == null) {
      return 0;
    }

    if (playbackSong.duration == 0) {
      return 0;
    }

    final currentTime = sliderValue / scale * playbackSong.duration;

    return currentTime.clamp(0, playbackSong.duration);
  }

  void _onChanged(double sliderValue) {
    final playerApi = ref.read(playerApiFactoryProvider);
    final time = _toCurrentTime(sliderValue);

    playerApi.seek(time);
    ref.read(currentTimeProvider.notifier).seek(time);
  }

  @override
  Widget build(BuildContext context) {
    final playbackSong = ref.watch(playbackSongProvider);
    final currentTime = ref.watch(currentTimeProvider);

    ref.listen(isPlayingProvider, (previousIsPlaying, newIsPlaying) {
      if (newIsPlaying) {
        _startTimer();
      } else {
        _stopTimer();
        ref.read(currentTimeProvider.notifier).updateCurrentTime();
      }
    });

    if (playbackSong == null) {
      return Container();
    }

    Color primaryColor = Theme.of(context).textTheme.bodyLarge?.color! ?? Colors.black;
    final isTablet = isTabletDevice(context);
    final padding = isTablet ? StyleConstant.padding.large : StyleConstant.padding.medium;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Slider(
            value: _toSliderValue(currentTime, playbackSong.duration),
            max: scale,
            activeColor: primaryColor,
            divisions: scale.toInt(),
            onChanged: _onChanged,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: StyleConstant.padding.large),
            child: Row(
              children: [
                Text(_formatDuration(currentTime)),
                const Spacer(),
                Text(_formatDuration(playbackSong.duration)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
