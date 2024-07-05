import 'package:flutter/material.dart';
// import 'package:thinmpf/pigeon_output/artwork.g.dart';

class ImageWidget extends StatefulWidget {
  final String id;

  const ImageWidget({
    super.key,
    required this.id,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {

  // final api = HostArtworkApi();
  // final data = await api.queryArtwork(id);

  @override
  Widget build(BuildContext context) {
    return Text(widget.id);
  }
}