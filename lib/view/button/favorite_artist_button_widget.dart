import 'package:flutter/material.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class FavoriteArtistButtonWidget extends StatelessWidget {
  const FavoriteArtistButtonWidget({Key? key}) : super(key: key);

  void _favoriteArtist() {}

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.person_rounded, size: 50.0, callback: _favoriteArtist);
  }
}
