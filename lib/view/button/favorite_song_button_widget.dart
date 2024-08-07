import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class FavoriteSongButtonWidget extends StatelessWidget {
  const FavoriteSongButtonWidget({Key? key}) : super(key: key);

  void _favoriteSong() {

  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.favorite_rounded, size: SizeConstant.medium, callback: _favoriteSong);
  }
}
