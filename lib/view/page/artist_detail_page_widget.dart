import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/album_provider.dart';
import 'package:thinmpf/provider/artist_albums_provider.dart';
import 'package:thinmpf/provider/artist_songs_provider.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

class ArtistDetailPageWidget extends ConsumerWidget {
  final String id;

  const ArtistDetailPageWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistAlbums = ref.watch(artistAlbumsProvider(id)).value ?? [];
    final artistSongs = ref.watch(artistSongsProvider(id)).value ?? [];

    if (artistSongs.isEmpty) {
      return Container();
    }

    final subTitle = ' songs';
    final song = artistSongs.first!;
    final screenSize = MediaQuery.sizeOf(context);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: screenSize.width - top,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(song.artist),
              background: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Blur(
                      blur: 10,
                      blurColor: Colors.white,
                      child: ImageWidget(id: song.imageId, size: screenSize.width),
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
                            Color(0x00ffffff),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(child: ImageWidget(id: song.imageId, size: screenSize.width * 0.6)),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text(subTitle),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final album = artistAlbums[index]!;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AlbumDetailPageWidget(id: album.id)),
                      );
                    },
                    child: AlbumCellWidget(album: album),
                  );
                },
                childCount: artistAlbums.length,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 60,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // player.startAllSongs(index);
                },
                child: MediaRowWidget(song: artistSongs[index]!),
              );
            }, childCount: artistSongs.length),
          ),
        ],
      ),
    );
  }
}
