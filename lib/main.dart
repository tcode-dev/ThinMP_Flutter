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
        body: Column(
          children: ['item1', 'item2'].map((item) => Text(item)).toList()),
      ),
    );
  }
}
