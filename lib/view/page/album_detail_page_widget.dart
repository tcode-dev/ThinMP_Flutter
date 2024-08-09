import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumDetailPageWidget extends ConsumerWidget {
  final String id;

  const AlbumDetailPageWidget({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Text("album detail page"),
        ],
      ),
    );
  }
}
