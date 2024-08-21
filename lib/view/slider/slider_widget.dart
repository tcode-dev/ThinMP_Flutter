import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/current_time_provider.dart';
import 'package:thinmpf/provider/is_playing_provider.dart';
import 'package:thinmpf/provider/playback_song_provider.dart';

final PlayerHostApi _player = PlayerHostApi();

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
      ref.read(currentTimeProvider.notifier).update();
    }
  }

  @override
  void dispose() {
    _stopTimer();

    super.dispose();
  }

  void _startTimer() {
    ref.read(currentTimeProvider.notifier).update();

    _timer = Timer.periodic(const Duration(seconds: durationSeconds), (timer) {
      ref.read(currentTimeProvider.notifier).update();
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
    final time = _toCurrentTime(sliderValue);

    _player.seek(time);
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
        ref.read(currentTimeProvider.notifier).update();
      }
    });

    if (playbackSong == null) {
      return Container();
    }

    Color primaryColor = Theme.of(context).textTheme.bodyLarge?.color! ?? Colors.black;

    return Column(
      children: [
        Slider(
          value: _toSliderValue(currentTime, playbackSong.duration),
          max: scale,
          activeColor: primaryColor,
          divisions: scale.toInt(),
          onChanged: _onChanged,
        ),
        Container(
          padding: EdgeInsets.only(right: styleConstant[StyleType.padding][SizeConstant.large], left: styleConstant[StyleType.padding][SizeConstant.large]),
          child: Row(
            children: [
              Text(_formatDuration(currentTime)),
              const Spacer(),
              Text(_formatDuration(playbackSong.duration)),
            ],
          ),
        )
      ],
    );
  }
}
