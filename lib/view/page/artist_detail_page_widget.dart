import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/artist_albums_provider.dart';
import 'package:thinmpf/provider/artist_songs_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/util/calc_child_aspect_ratio.dart';
import 'package:thinmpf/util/calc_cross_axis_count.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

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

    final subTitle = '${artistAlbums.length} albums, ${artistSongs.length} songs';
    final album = artistAlbums.first!;
    final screenSize = MediaQuery.sizeOf(context);
    final crossAxisCount = calcCrossAxisCount(screenSize.width);
    final childAspectRatio = calcChildAspectRatio(screenSize.width, crossAxisCount);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: screenSize.width - top,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(album.artistName),
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: Blur(
                          blur: 10,
                          blurColor: Theme.of(context).transparent,
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
                                Theme.of(context).transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Center(child: CircleImageWidget(id: album.imageId, size: screenSize.width * 0.33)),
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
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text("Albums", style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(styleConstant[StyleType.padding][SizeConstant.large]),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: childAspectRatio,
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
                    mainAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
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
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10, left: 20),
                  child: Text("Songs", style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 60,
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _player.startArtistSongs(index, id);
                    },
                    child: MediaRowWidget(song: artistSongs[index]!),
                  );
                }, childCount: artistSongs.length),
              ),
              const SliverToBoxAdapter(
                child: EmptyRowWidget(),
              ),
            ],
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
