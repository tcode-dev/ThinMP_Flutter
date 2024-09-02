import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/player/favorite_song_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class FavoriteSongButtonWidget extends ConsumerStatefulWidget {
  const FavoriteSongButtonWidget({super.key});

  @override
  FavoriteSongButtonWidgetState createState() => FavoriteSongButtonWidgetState();
}

class FavoriteSongButtonWidgetState extends ConsumerState<FavoriteSongButtonWidget> {
  void _favoriteSong() {
    ref.read(favoriteSongProvider.notifier).toggleFavoriteSong();
  }

  @override
  Widget build(BuildContext context) {
    final isfavoriteSong = ref.watch(favoriteSongProvider);
    final opacity = isfavoriteSong ? StyleConstant.opacity.on : StyleConstant.opacity.off;

    return Opacity(opacity: opacity, child: ButtonWidget(icon: Icons.favorite_rounded, size: StyleConstant.button.small, imageSize: StyleConstant.image.small, callback: _favoriteSong));
  }
}
