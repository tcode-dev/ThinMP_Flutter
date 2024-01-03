import 'package:flutter/material.dart';
import 'package:thinmpf/plugin/songs_plugin.dart';
import 'package:thinmpf/view/songs_page_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  String _test = 'test';

  void _getTest() async {
    String test = await getTest();

    setState(() {
      _test = test;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SongsPageView()),
            );
          },
          child: Text(_test),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTest,
        tooltip: 'getTest',
        child: const Icon(Icons.add),
      ),
    );
  }
}
