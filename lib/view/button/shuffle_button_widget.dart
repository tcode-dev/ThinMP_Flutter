import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/player/shuffle_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';

class ShuffleButtonWidget extends ConsumerStatefulWidget {
  const ShuffleButtonWidget({super.key});

  @override
  ShuffleButtonWidgetState createState() => ShuffleButtonWidgetState();
}

class ShuffleButtonWidgetState extends ConsumerState<ShuffleButtonWidget> {
  Future<void> _shuffle() async {
    try {
      await ref.read(shuffleProvider.notifier).changeShuffle();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to change shuffle: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(shuffleProvider);

    return asyncValue.when(
      loading: () => const LoadingWidget(),
      error: (Object error, StackTrace stackTrace) => const LoadingWidget(),
      data: (provider) {
        final opacity = provider == ShuffleMode.off ? 0.5 : 1.0;

        return Opacity(
          opacity: opacity,
          child: ButtonWidget(icon: Icons.shuffle_rounded, size: 50.0, callback: _shuffle),
        );
      },
    );
  }
}
