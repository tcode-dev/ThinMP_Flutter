import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/player/shuffle_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class ShuffleButtonWidget extends ConsumerStatefulWidget {
  const ShuffleButtonWidget({super.key});

  @override
  ShuffleButtonWidgetState createState() => ShuffleButtonWidgetState();
}

class ShuffleButtonWidgetState extends ConsumerState<ShuffleButtonWidget> {
  void _shuffle() {
    ref.read(shuffleProvider.notifier).changeShuffle();

    final newShuffleMode = ref.read(shuffleProvider);

    _player.setShuffle(newShuffleMode);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.shuffle_rounded, size: 50.0, callback: _shuffle);
  }
}
