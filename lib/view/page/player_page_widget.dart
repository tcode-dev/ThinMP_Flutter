import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';

class PlayerPageWidget extends ConsumerStatefulWidget {
  const PlayerPageWidget({super.key});

  @override
  PlayerPageWidgetState createState() => PlayerPageWidgetState();
}

class PlayerPageWidgetState extends ConsumerState<PlayerPageWidget> {
  final PlayerHostApi player = PlayerHostApi();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Player Page"));
  }
}
