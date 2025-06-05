// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/player/favorite_artist_provider.dart';
import 'package:thinmpf/view/button/button_widget.dart';

class FavoriteArtistButtonWidget extends ConsumerStatefulWidget {
  const FavoriteArtistButtonWidget({super.key});

  @override
  FavoriteSongButtonWidgetState createState() => FavoriteSongButtonWidgetState();
}

class FavoriteSongButtonWidgetState extends ConsumerState<FavoriteArtistButtonWidget> {
  void _favorite() {
    ref.read(favoriteArtistProvider.notifier).toggleFavorite();
  }

  @override
  Widget build(BuildContext context) {
    final isfavoriteSong = ref.watch(favoriteArtistProvider);
    final opacity = isfavoriteSong ? StyleConstant.opacity.on : StyleConstant.opacity.off;

    return Opacity(opacity: opacity, child: ButtonWidget(icon: Icons.person_rounded, size: StyleConstant.button.small, imageSize: StyleConstant.image.small, callback: _favorite));
  }
}
