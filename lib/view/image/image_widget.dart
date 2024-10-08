import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

final _api = ArtworkHostApi();

class ImageWidget extends StatefulWidget {
  final String id;
  final double size;
  final bool useFallbackImage;

  const ImageWidget({
    super.key,
    required this.id,
    required this.size,
    this.useFallbackImage = true,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _api.getArtwork(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
          );
        } else if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          return Image.memory(
            snapshot.data!,
            width: widget.size,
            height: widget.size,
            fit: BoxFit.cover,
          );
        }
        if (widget.useFallbackImage) {
          return Image.asset(
            'assets/images/song_dark.png',
            width: widget.size,
            height: widget.size,
            fit: BoxFit.cover,
          );
        } else {
          return SizedBox(
            width: widget.size,
            height: widget.size,
          );
        }
      },
    );
  }
}
