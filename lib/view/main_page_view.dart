import 'package:flutter/material.dart';
import 'package:thinmpf/view/second_page_view.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPageView()),
            );
          },
          child: const Text('to SecondPageView'),
        ),
      ),
    );
  }
}