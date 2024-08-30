import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/player/repeat_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';

class RepeatButtonWidget extends ConsumerStatefulWidget {
  const RepeatButtonWidget({super.key});

  @override
  RepeatButtonWidgetState createState() => RepeatButtonWidgetState();
}

class RepeatButtonWidgetState extends ConsumerState<RepeatButtonWidget> {
  Future<void> _repeat() async {
    try {
      await ref.read(repeatProvider.notifier).changeRepeat();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to change repeat: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(repeatProvider);

    return asyncValue.when(
      loading: () => const LoadingWidget(),
      error: (Object error, StackTrace stackTrace) => const LoadingWidget(),
      data: (provider) {
        final opacity = provider == RepeatMode.off ? 0.5 : 1.0;
        final icon = provider == RepeatMode.one ? Icons.repeat_one_rounded : Icons.repeat_rounded;

        return Opacity(
          opacity: opacity,
          child: ButtonWidget(icon: icon, size: 50.0, callback: _repeat),
        );
      },
    );
  }
}
