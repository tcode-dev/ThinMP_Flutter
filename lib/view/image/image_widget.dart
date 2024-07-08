import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:thinmpf/pigeon_output/artwork.g.dart';

class ImageWidget extends StatefulWidget {
  final String id;
  final double size;

  const ImageWidget({
    super.key,
    required this.id,
    required this.size,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    final api = HostArtworkApi();

    return FutureBuilder<Uint8List?>(
      future: api.queryArtwork(widget.id),
      builder: (context, item) {
        if (item.data != null && item.data!.isNotEmpty) {
          return Image.memory(item.data!, width: widget.size, height: widget.size);
        }
        return Image.asset('images/song_dark.png');
      },
    );
  }
}