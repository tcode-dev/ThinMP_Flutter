import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/artists_provider.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class ArtistsPageWidget extends ConsumerWidget {
  final PlayerHostApi player = PlayerHostApi();

  ArtistsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(artistsProvider).value ?? [];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: const Text('Artists'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: artists.length,
            itemBuilder: (context, index) {
              final artist = artists[index]!;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArtistDetailPageWidget(id: artist.id)),
                  );
                },
                child: PlainRowWidget(title: artist.name),
              );
            },
          ),
          const Positioned(
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: MiniPlayerWidget(),
          ),
        ],
      ),
    );
  }
}
