import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/view/page/songs_page_view.dart';

class MainPageView extends ConsumerWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SongsPageView()),
            );
          },
          child: const Text('songs'),
        ),
      ),
    );
  }
}
