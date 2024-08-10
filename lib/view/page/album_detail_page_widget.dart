import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/album_provider.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class AlbumDetailPageWidget extends ConsumerWidget {
  final String id;

  const AlbumDetailPageWidget({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(albumProvider(id)).value;

    if (album == null) {
      return Container();
    }

    Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: Blur(
              blur: 10,
              blurColor: Colors.white,
              child: ImageWidget(id: album.imageId, size: screenSize.width),
            ),
          ),
          Positioned(
            top: screenSize.width - 200,
            width: screenSize.width,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Theme.of(context).scaffoldBackgroundColor,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
