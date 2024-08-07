import 'package:flutter/material.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class FavoriteSongButtonWidget extends StatelessWidget {
  const FavoriteSongButtonWidget({Key? key}) : super(key: key);

  void _favoriteSong() {

  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.favorite_rounded, size: 50.0, imageSize: 44.0, callback: _favoriteSong);
  }
}
