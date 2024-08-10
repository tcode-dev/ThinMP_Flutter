import 'package:flutter/material.dart';
import 'package:thinmpf/view/page/albums_page_widget.dart';
import 'package:thinmpf/view/page/artists_page_widget.dart';
import 'package:thinmpf/view/page/songs_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 100.0,
            right: 0.0,
            left: 0.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArtistsPageWidget()),
                );
              },
              child: const Text('Artists'),
            ),
          ),
          Positioned(
            top: 200.0,
            right: 0.0,
            left: 0.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlbumsPageWidget()),
                );
              },
              child: const Text('Albums'),
            ),
          ),
          Positioned(
            top: 300.0,
            right: 0.0,
            left: 0.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongsPageWidget()),
                );
              },
              child: const Text('Songs'),
            ),
          ),
          const Positioned(
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: MiniPlayerWidget(),
          ),
        ],
      ),
    );
  }
}
