import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class NextButtonWidget extends ConsumerStatefulWidget {
  final double size;
  final double? imageSize;

  const NextButtonWidget({super.key, required this.size, this.imageSize});

  @override
  NextButtonWidgetState createState() => NextButtonWidgetState();
}

class NextButtonWidgetState extends ConsumerState<NextButtonWidget> {
  void _next() {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);

    playerHostApi.next();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.skip_next_rounded, size: widget.size, imageSize: widget.imageSize, callback: _next);
  }
}
