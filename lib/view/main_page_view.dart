import 'package:flutter/material.dart';

import 'package:thinmpf/plugin/songs_plugin.dart';
import 'package:thinmpf/provider/counter_provider.dart';
import 'package:thinmpf/provider/test_provider.dart';
import 'package:thinmpf/view/songs_page_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MainPageView extends StatefulWidget {
//   const MainPageView({super.key});

//   @override
//   State<MainPageView> createState() => _MainPageViewState();
// }
// final counterUpdate = (state: int) {
//   return 1;
// };
class MainPageView extends ConsumerWidget {
  const MainPageView({super.key});
  // String _test = 'test';

  // void _getTest() async {
  //   String test = await getTest();

  //   setState(() {
  //     _test = test;
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final testAsync = ref.watch(testProvider);
    final test = testAsync.when(
      loading: () => 'loading',
      data: (data) => data,
      error: (error, stacktrace) => 'error',
    );
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SongsPageView()),
            );
          },
          child: Text('test: $test'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        tooltip: 'getTest',
        child: const Icon(Icons.add),
      ),
    );
  }
}
