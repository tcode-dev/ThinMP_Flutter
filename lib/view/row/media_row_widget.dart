import 'package:flutter/material.dart';
import 'package:thinmpf/view/image/image_widget.dart';

class MediaRowWidget extends StatelessWidget {
  final String id;
  final String title;
  final String artist;

  const MediaRowWidget({
    super.key,
    required this.id,
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10.0),
        child: Column(children: [
          Row(children: [
            Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: 10.0),
                child: ImageWidget(id: id, size: 40)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), Text(artist)],
            ),
          ]),
          const Divider()
        ]));
  }
}
