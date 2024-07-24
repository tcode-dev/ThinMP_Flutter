import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';

final player = PlayerHostApi();

class MiniPlayerWidget extends StatefulWidget {
  const MiniPlayerWidget({
    super.key,
  });

  @override
  State<MiniPlayerWidget> createState() => _MiniPlayerWidgetState();
}

class _MiniPlayerWidgetState extends State<MiniPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: api.queryArtwork(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(width: widget.size, height: widget.size);
        } else if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          return Image.memory(snapshot.data!,
              width: widget.size, height: widget.size);
        }
        return Image.asset('images/song_dark.png',
            width: widget.size, height: widget.size);
      },
    );
  }
}
