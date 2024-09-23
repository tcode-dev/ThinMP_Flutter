import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class PrevButtonWidget extends ConsumerStatefulWidget {
  const PrevButtonWidget({super.key});

  @override
  PrevButtonWidgetState createState() => PrevButtonWidgetState();
}

class PrevButtonWidgetState extends ConsumerState<PrevButtonWidget> {
  void _prev() {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);

    playerHostApi.prev();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.skip_previous_rounded, size: StyleConstant.button.medium, callback: _prev);
  }
}
