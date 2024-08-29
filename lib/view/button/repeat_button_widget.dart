import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/player/repeat_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class RepeatButtonWidget extends ConsumerStatefulWidget {
  const RepeatButtonWidget({super.key});

  @override
  RepeatButtonWidgetState createState() => RepeatButtonWidgetState();
}

class RepeatButtonWidgetState extends ConsumerState<RepeatButtonWidget> {
  void _repeat() {
    ref.read(repeatProvider.notifier).changeRepeat();

    final newRepeatMode = ref.read(repeatProvider);

    _player.setRepeat(newRepeatMode);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(repeatProvider);
    final opacity = provider == RepeatMode.off ? 0.5 : 1.0;
    final icon = provider == RepeatMode.one ? Icons.repeat_one_rounded : Icons.repeat_rounded;

    return Opacity(
      opacity: opacity,
      child: ButtonWidget(icon: icon, size: 50.0, callback: _repeat),
    );
  }
}
