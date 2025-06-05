// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class PrevButtonWidget extends ConsumerStatefulWidget {
  const PrevButtonWidget({super.key});

  @override
  PrevButtonWidgetState createState() => PrevButtonWidgetState();
}

class PrevButtonWidgetState extends ConsumerState<PrevButtonWidget> {
  void _prev() {
    final playerApi = ref.read(playerApiFactoryProvider);

    playerApi.prev();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.skip_previous_rounded, size: StyleConstant.button.medium, callback: _prev);
  }
}
