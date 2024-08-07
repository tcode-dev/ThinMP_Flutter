import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class FavoriteArtistButtonWidget extends StatelessWidget {
  const FavoriteArtistButtonWidget({Key? key}) : super(key: key);

  void _favoriteArtist() {

  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(icon: Icons.person_rounded, size: SizeConstant.medium, callback: _favoriteArtist);
  }
}
