import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {}, 
            child: const Text("button")
          )
        ),
      ),
    );
  }
}
