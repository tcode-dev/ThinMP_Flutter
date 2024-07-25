import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/api/player_flutter_api_impl.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';
import 'package:thinmpf/view/page/main_page_view.dart';
import 'package:thinmpf/view/permission/permission_widget.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );

  PlayerFlutterApi.setup(PlayerFlutterApiImpl());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PermissionWidget(child: MainPageView()));
  }
}
