import 'package:flutter/material.dart';

class SongsPageView extends StatelessWidget {
  const SongsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Go back!'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Sub Count'),
          ),
        ],
      )
    );
  }
}